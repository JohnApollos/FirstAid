import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'models/procedure.dart';
import 'models/quiz_question.dart';
import 'models/telemetry_log.dart';

/// Service class to manage all Isar NoSQL database operations.
/// Handles offline data fetching, search indexing, and telemetry logging.
class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = _openDB();
  }

  Future<Isar> _openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [ProcedureSchema, QuizQuestionSchema, TelemetryLogSchema],
        directory: dir.path,
        inspector: true, // Enables Isar database inspector during debug
      );

      // Seed data if empty
      await _seedDataIfNeeded(isar);
      return isar;
    }
    return Isar.getInstance()!;
  }

  Future<void> _seedDataIfNeeded(Isar isar) async {
    final proceduresCount = await isar.procedures.count();
    if (proceduresCount == 0) {
      await isar.writeTxn(() async {
        // 1. Seed Procedures & Steps
        final procedures = _getInitialProcedures();
        await isar.procedures.putAll(procedures);

        // 2. Seed Quiz Questions
        final quizQuestions = _getInitialQuizQuestions();
        await isar.quizQuestions.putAll(quizQuestions);
      });
    }
  }

  // --- Procedures API ---

  Future<List<Procedure>> getAllProcedures() async {
    final isar = await db;
    return await isar.procedures.where().findAll();
  }

  Future<List<Procedure>> searchProcedures(String query) async {
    final isar = await db;
    if (query.isEmpty) {
      return await getAllProcedures();
    }
    return await isar.procedures
        .filter()
        .titleEnContains(query, caseSensitive: false)
        .or()
        .titleSwContains(query, caseSensitive: false)
        .findAll();
  }

  // --- Quiz API ---

  Future<List<QuizQuestion>> getAllQuizQuestions() async {
    final isar = await db;
    return await isar.quizQuestions.where().findAll();
  }

  // --- Telemetry API ---

  Future<void> logEvent(String eventType, Map<String, dynamic> details) async {
    final isar = await db;
    final log = TelemetryLog()
      ..timestamp = DateTime.now()
      ..eventType = eventType
      ..details = details.toString()
      ..synced = false;

    await isar.writeTxn(() async {
      await isar.telemetryLogs.put(log);
    });
  }

  Future<List<TelemetryLog>> getUnsyncedTelemetry() async {
    final isar = await db;
    return await isar.telemetryLogs.filter().syncedEqualTo(false).findAll();
  }

  Future<void> markTelemetryAsSynced(List<int> ids) async {
    final isar = await db;
    await isar.writeTxn(() async {
      for (final id in ids) {
        final log = await isar.telemetryLogs.get(id);
        if (log != null) {
          log.synced = true;
          await isar.telemetryLogs.put(log);
        }
      }
    });
  }

  // --- Initial Seed Helpers ---

  List<Procedure> _getInitialProcedures() {
    return [
      Procedure()
        ..titleEn = "CPR (Adult)"
        ..titleSw = "Resusitasi - CPR (Mtu Mzima)"
        ..iconName = "ic_cpr_adult"
        ..severityLevel = 1
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Call for Help. Ask a bystander to call 1199 and get an AED."
            ..instructionSw = "Piga simu kuomba usaidizi. Mwombe mtu aliye karibu apige simu kwa 1199 na alete kifaa cha AED."
            ..imageResource = "img_phone",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Position Hands. Heel of one hand on center of chest. Interlock other on top."
            ..instructionSw = "Weka mikono vizuri. Weka kisigino cha mkono mmoja katikati ya kifua. Weka mkono mwingine juu yake huku ukifunga vidole."
            ..imageResource = "img_cpr_hand",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Compressions. Push hard and fast. Depth 5-6 cm. Rate 100-120 bpm."
            ..instructionSw = "Minyinyo ya Kifua. Bonyeza kwa nguvu na haraka. Kina cha sentimita 5-6. Kasi ya minyinyo 100-120 kwa dakika."
            ..imageResource = "img_cpr_compress",
          FirstAidStep()
            ..stepOrder = 4
            ..instructionEn = "Rescue Breaths. 30 compressions -> 2 breaths. Tilt head, pinch nose, seal mouth."
            ..instructionSw = "Pumzi ya Uokoaji. Minyinyo 30 kisha pumzi 2. Inua kichwa juu kidogo, finya pua, na uweke kinywa chako kwenye kinywa chake kabisa."
            ..imageResource = "img_cpr_breath",
          FirstAidStep()
            ..stepOrder = 5
            ..instructionEn = "Repeat. Continue 30:2 cycle until help arrives or breathing starts."
            ..instructionSw = "Rudia. Endelea na mzunguko wa 30:2 hadi msaada utakapofika au mgonjwa aanze kupumua."
            ..imageResource = "img_cpr_adult_1",
        ],
      Procedure()
        ..titleEn = "CPR (Child/Infant)"
        ..titleSw = "Resusitasi - CPR (Mtoto)"
        ..iconName = "ic_cpr_baby"
        ..severityLevel = 1
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Initial Breaths. Give 5 initial rescue breaths before starting compressions."
            ..instructionSw = "Pumzi za Kwanza. Toa pumzi 5 za uokoaji kabla ya kuanza minyinyo ya kifua."
            ..imageResource = "img_cpr_baby_4",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Position Hands. Infant: 2 fingers. Child: 1 hand heel."
            ..instructionSw = "Nafasi ya Mikono. Mtoto mchanga: vidole 2. Mtoto mkubwa: kisigino cha mkono mmoja."
            ..imageResource = "img_cpr_baby_2",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Compressions. Press down 1/3 depth. Rate 100-120 bpm."
            ..instructionSw = "Minyinyo. Bonyeza chini kwa kina cha 1/3 ya kifua. Kasi ya minyinyo 100-120 kwa dakika."
            ..imageResource = "img_cpr_baby_3",
          FirstAidStep()
            ..stepOrder = 4
            ..instructionEn = "Cycle. Maintain ratio of 30 compressions : 2 breaths."
            ..instructionSw = "Mzunguko. Weka uwiano wa minyinyo 30 kwa pumzi 2."
            ..imageResource = "img_cpr_baby_3",
          FirstAidStep()
            ..stepOrder = 5
            ..instructionEn = "Call 1199. If alone, perform CPR for 1 minute before leaving to call."
            ..instructionSw = "Piga 1199. Ikiwa uko peke yako, fanya CPR kwa dakika 1 kabla ya kuondoka kwenda kupiga simu."
            ..imageResource = "img_phone",
        ],
      Procedure()
        ..titleEn = "Choking"
        ..titleSw = "Kukabwa Koo / Kikohozi"
        ..iconName = "ic_choking"
        ..severityLevel = 1
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Back Blows. Give up to 5 sharp blows between shoulder blades."
            ..instructionSw = "Mabapa ya Mgongoni. Toa hadi mapigo 5 makali kati ya mabega ya mgongo."
            ..imageResource = "img_choking_2",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Abdominal Thrusts. Fist above navel. Pull sharply inward and upward."
            ..instructionSw = "Minyinyo ya Tumbo. Weka ngumi juu ya kitovu. Vuta kwa nguvu kuelekea ndani na juu."
            ..imageResource = "img_choking_3",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Repeat. Cycle 5 back blows and 5 abdominal thrusts."
            ..instructionSw = "Rudia. Endelea na mzunguko wa mapigo 5 ya mgongo na minyinyo 5 ya tumbo."
            ..imageResource = "img_choking_4",
        ],
      Procedure()
        ..titleEn = "Severe Bleeding"
        ..titleSw = "Kuvuja Damu Sana"
        ..iconName = "ic_bleeding"
        ..severityLevel = 1
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Protect Yourself. Wear disposable gloves if available."
            ..instructionSw = "Jilinde. Vaa glavu za kutupwa zikiwa zinasomeka."
            ..imageResource = "img_bleeding_1",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Direct Pressure. Apply firm pressure using sterile dressing."
            ..instructionSw = "Kukandamiza Jeraha. Bonyeza kwa nguvu ukitumia kitambaa safi kilichosafishwa vyema."
            ..imageResource = "img_bleeding_1",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Elevate. Raise injured limb above heart level."
            ..instructionSw = "Kuinua. Kuinua kiungo kilichojeruhiwa juu ya kiwango cha moyo."
            ..imageResource = "img_bleeding_2",
          FirstAidStep()
            ..stepOrder = 4
            ..instructionEn = "Bandage. Secure dressing tight but don't stop circulation."
            ..instructionSw = "Kufunga Bendeji. Funga jeraha vizuri lakini usizuie mzunguko wa damu."
            ..imageResource = "img_bleeding_3",
          FirstAidStep()
            ..stepOrder = 5
            ..instructionEn = "Call 1199. Monitor for shock (pale, cold skin)."
            ..instructionSw = "Piga 1199. Fuatilia dalili za mshtuko (ngozi kuwa ya rangi ya kijivu au baridi)."
            ..imageResource = "img_phone",
        ],
      Procedure()
        ..titleEn = "Burns & Scalds"
        ..titleSw = "Majeraha ya Moto na Maji Moto"
        ..iconName = "ic_burns"
        ..severityLevel = 2
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Stop the Burning. Move away from heat source. Put out flames."
            ..instructionSw = "Komesha Moto. Ondoka kwenye chanzo cha joto. Zima moto."
            ..imageResource = "img_burns_1",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Cool the Burn. Cool running tepid water for 20 mins. NO ICE."
            ..instructionSw = "Baridisha Jeraha. Osha kwa maji baridi yanayotiririka kwa dakika 20. USIWEKE BARAFU."
            ..imageResource = "img_burns_1",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Remove Constrictions. Remove jewelry/clothing near burn before swelling."
            ..instructionSw = "Ondoa Vifungo. Ondoa mapambo au nguo karibu na jeraha kabla ya kuvimba."
            ..imageResource = "img_burns_1",
          FirstAidStep()
            ..stepOrder = 4
            ..instructionEn = "Cover. Cover loosely with cling film or sterile non-fluffy dressing."
            ..instructionSw = "Funika. Funika kwa ulegevu ukitumia nailoni safi au kitambaa safi kisichokuwa na nyuzi."
            ..imageResource = "img_burns_cover",
        ],
      Procedure()
        ..titleEn = "Fractures"
        ..titleSw = "Mivunjiko ya Mifupa"
        ..iconName = "ic_fracture"
        ..severityLevel = 2
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Immobilize. Support injury with hand or use padding/slings."
            ..instructionSw = "Zuia Kusonga. Shikilia jeraha kwa mkono wako au tumia vitambaa laini/kamba ya kusaidia mkono."
            ..imageResource = "img_fracture_1",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Splinting. Secure injured limb to a sound part of the body."
            ..instructionSw = "Kuweka Mbao. Funga kiungo kilichojeruhiwa kwa kiungo kingine kizima cha mwili."
            ..imageResource = "img_fracture_2",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Check Circulation. Check for feeling, warmth, and skin color."
            ..instructionSw = "Angalia Mzunguko wa Damu. Angalia kama kuna hisia, joto, na rangi ya ngozi."
            ..imageResource = "img_fracture_3",
          FirstAidStep()
            ..stepOrder = 4
            ..instructionEn = "Call 1199. Do not move person unnecessarily."
            ..instructionSw = "Piga 1199. Usiondoe mtu bila sababu ya msingi."
            ..imageResource = "img_phone",
        ],
      Procedure()
        ..titleEn = "Seizures"
        ..titleSw = "Kifafa / Degedege"
        ..iconName = "ic_seizure"
        ..severityLevel = 2
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Safety. Move dangerous objects away. Do not restrain."
            ..instructionSw = "Usalama. Ondoa vitu hatari karibu na mgonjwa. Usimzuie kusonga."
            ..imageResource = "img_seizure_1",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Protect the Head. Place something soft under their head."
            ..instructionSw = "Linda Kichwa. Weka kitu laini chini ya kichwa chake."
            ..imageResource = "img_seizure_2",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Time It. Call 1199 if > 5 mins. Note start/end time."
            ..instructionSw = "Piga Chapa Muda. Piga 1199 ikiwa kifafa kitaendelea zaidi ya dakika 5. Andika muda wa kuanza na kuisha."
            ..imageResource = "img_seizure_3",
          FirstAidStep()
            ..stepOrder = 4
            ..instructionEn = "Post-Seizure. Check breathing and roll into Recovery Position."
            ..instructionSw = "Baada ya Kifafa. Angalia pumzi na mlaze katika nafasi ya kupona (Recovery Position)."
            ..imageResource = "img_recovery",
        ],
      Procedure()
        ..titleEn = "Snake Bites"
        ..titleSw = "Kung'atwa na Nyoka"
        ..iconName = "ic_snake"
        ..severityLevel = 1
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Stay Calm. Reassure patient. Panic spreads venom."
            ..instructionSw = "Tulia. Mtulize mgonjwa. Mshtuko na hofu hueneza sumu haraka mwilini."
            ..imageResource = "img_snake_1",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Immobilize. Keep limb still and below heart level."
            ..instructionSw = "Zuia Kusonga. Weka kiungo kilichong'atwa kikiwa kimetulia na chini ya kiwango cha moyo."
            ..imageResource = "img_snake_2",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Description. Remember snake color/shape."
            ..instructionSw = "Maelezo ya Nyoka. Kumbuka rangi na umbo la nyoka huyo."
            ..imageResource = "img_snake_no",
          FirstAidStep()
            ..stepOrder = 4
            ..instructionEn = "Call 1199. Transport to hospital immediately. NO sucking venom."
            ..instructionSw = "Piga 1199. Mpeleke hospitalini haraka. USINYONYE sumu kwa mdomo."
            ..imageResource = "img_ambulance",
        ],
      Procedure()
        ..titleEn = "Poisoning"
        ..titleSw = "Sumu"
        ..iconName = "ic_poison"
        ..severityLevel = 1
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Safety Check. Ensure you are not exposed to poison."
            ..instructionSw = "Ukaguzi wa Usalama. Hakikisha kuwa wewe pia hauko katika hatari ya sumu hiyo."
            ..imageResource = "img_poison_1",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Identify. What was taken? Keep packaging."
            ..instructionSw = "Tambua. Sumu gani imemezwa? Hifadhi kibandiko au chombo chake."
            ..imageResource = "img_poison_1",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Call 1199. Follow dispatcher's advice. NO vomiting unless told."
            ..instructionSw = "Piga 1199. Fuata ushauri wa mhudumu wa simu. USIMSABABISHE kutapika isipokuwa ukiambiwa."
            ..imageResource = "img_phone",
          FirstAidStep()
            ..stepOrder = 4
            ..instructionEn = "Monitor. Watch breathing. Recovery Position if unconscious."
            ..instructionSw = "Fuatilia. Angalia upumuaji wake. Mlaze katika nafasi ya kupona ikiwa hajitambui."
            ..imageResource = "img_recovery",
        ],
      Procedure()
        ..titleEn = "Heart Attack"
        ..titleSw = "Shambulio la Moyo"
        ..iconName = "ic_heart"
        ..severityLevel = 1
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..instructionEn = "Call 1199 Immediately. This is a medical emergency."
            ..instructionSw = "Piga 1199 Haraka Sana. Hii ni dharura kubwa ya matibabu."
            ..imageResource = "img_phone",
          FirstAidStep()
            ..stepOrder = 2
            ..instructionEn = "Position. Sit down, knees bent, head supported (W Position)."
            ..instructionSw = "Kaa Nafasi Nzuri. Mketishe chini, magoti yakiwa yamevunjwa na kichwa kikiegemea (Nafasi ya W)."
            ..imageResource = "img_heart_sit",
          FirstAidStep()
            ..stepOrder = 3
            ..instructionEn = "Medication. Chew 300mg Aspirin if not allergic."
            ..instructionSw = "Dawa. Tafuna Aspirini ya miligramu 300 ikiwa hana mzio (allergic)."
            ..imageResource = "img_aspirin",
          FirstAidStep()
            ..stepOrder = 4
            ..instructionEn = "Monitor. Be prepared to perform CPR if they stop breathing."
            ..instructionSw = "Fuatilia. Kuwa tayari kufanya CPR ikiwa upumuaji utasimama."
            ..imageResource = "img_cpr_adult_1",
        ],
    ];
  }

  List<QuizQuestion> _getInitialQuizQuestions() {
    return [
      QuizQuestion()
        ..questionEn = "What is the correct ratio of chest compressions to rescue breaths for Adult CPR?"
        ..questionSw = "Ni upi uwiano sahihi wa minyinyo ya kifua kwa pumzi za uokoaji kwa CPR ya Mtu Mzima?"
        ..optionsEn = [
          "15 compressions : 2 breaths",
          "30 compressions : 2 breaths",
          "30 compressions : 5 breaths",
          "Continuous compressions only"
        ]
        ..optionsSw = [
          "minyinyo 15 : pumzi 2",
          "minyinyo 30 : pumzi 2",
          "minyinyo 30 : pumzi 5",
          "Minyinyo endelevu tu"
        ]
        ..correctOptionIndex = 1
        ..explanationEn = "30 compressions to 2 breaths is the standard ratio."
        ..explanationSw = "Minyinyo 30 kwa pumzi 2 ndio uwiano sahihi wa kawaida.",
      QuizQuestion()
        ..questionEn = "In Kenya, what is the primary emergency number for medical dispatch?"
        ..questionSw = "Nchini Kenya, ni nambari gani kuu ya dharura ya huduma ya ambulansi ya matibabu?"
        ..optionsEn = ["911", "1199", "999", "211"]
        ..optionsSw = ["911", "1199", "999", "211"]
        ..correctOptionIndex = 1
        ..explanationEn = "1199 is the Kenya Red Cross EPlus ambulance service number."
        ..explanationSw = "1199 ni nambari ya simu ya dharura ya Kenya Red Cross EPlus.",
      QuizQuestion()
        ..questionEn = "When treating a burn, how long should you cool the area with running tepid water?"
        ..questionSw = "Wakati wa kutibu jeraha la moto, unapaswa kupoza eneo lililoungua kwa maji yanayotiririka kwa muda gani?"
        ..optionsEn = ["5 minutes", "10 minutes", "20 minutes", "Until pain stops"]
        ..optionsSw = ["Dakika 5", "Dakika 10", "Dakika 20", "Hadi maumivu yaishe"]
        ..correctOptionIndex = 2
        ..explanationEn = "Cool for at least 20 minutes with running tepid water."
        ..explanationSw = "Baridisha kwa maji yanayotiririka kwa angalau dakika 20.",
      QuizQuestion()
        ..questionEn = "For a severe bleeding wound, what should you do if the first layer of gauze soaks through?"
        ..questionSw = "Kwa jeraha linalovuja damu sana, unapaswa kufanya nini ikiwa bendeji ya kwanza inajaa damu kabisa?"
        ..optionsEn = [
          "Remove it immediately",
          "Apply a tourniquet",
          "Add more dressing on top",
          "Wash the wound"
        ]
        ..optionsSw = [
          "IONDOE mara moja",
          "Weka chujio la damu (tourniquet)",
          "Ongeza bendeji nyingine juu yake",
          "Osha jeraha"
        ]
        ..correctOptionIndex = 2
        ..explanationEn = "Do not remove the first layer; it disturbs clotting. Add more dressing on top."
        ..explanationSw = "Usiondoe safu ya kwanza; inavuruga kuganda kwa damu. Ongeza bendeji zaidi juu yake.",
      QuizQuestion()
        ..questionEn = "What is the 'W Position' used for?"
        ..questionSw = "Nafasi ya W (W Position) hutumiwa kwa ajili ya dharura gani?"
        ..optionsEn = [
          "Snake bite treatment",
          "Fracture stabilization",
          "Heart Attack patient",
          "Seizure recovery"
        ]
        ..optionsSw = [
          "Matibabu ya kung'atwa na nyoka",
          "Kuzuia mfupa uliovunjika kusonga",
          "Mgonjwa wa Shambulio la Moyo (Heart Attack)",
          "Kupona baada ya kifafa"
        ]
        ..correctOptionIndex = 2
        ..explanationEn = "It helps ease strain on the heart during a heart attack."
        ..explanationSw = "Inasaidia kupunguza shinikizo na mzigo kwenye moyo wakati wa shambulio la moyo.",
    ];
  }
}
