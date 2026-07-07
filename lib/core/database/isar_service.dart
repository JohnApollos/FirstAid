import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/procedure.dart';
import 'models/quiz_question.dart';
import 'models/telemetry_log.dart';
import 'models/regional_directory.dart';



/// Service class to manage all Isar NoSQL database operations.
/// Handles offline data fetching, search indexing, regional directories, and telemetry consent.
class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = _openDB();
  }

  Future<Isar> _openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [
          ProcedureSchema,
          QuizQuestionSchema,
          TelemetryLogSchema,
          RegionalOfficeSchema,
          ReferralHospitalSchema,
        ],
        directory: dir.path,
        inspector: kDebugMode, // Enables Isar database inspector only in debug mode
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

    final officesCount = await isar.regionalOffices.count();
    if (officesCount == 0) {
      await isar.writeTxn(() async {
        // 3. Seed Regional Offices
        final offices = _getInitialRegionalOffices();
        await isar.regionalOffices.putAll(offices);

        // 4. Seed Referral Hospitals
        final hospitals = _getInitialReferralHospitals();
        await isar.referralHospitals.putAll(hospitals);
      });
    }
  }

  // --- Procedures API ---

  Future<List<Procedure>> getAllProcedures() async {
    final isar = await db;
    return await isar.procedures.where().findAll();
  }

  Future<List<Procedure>> searchProcedures(String query, String locale) async {
    final isar = await db;
    final all = await isar.procedures.where().findAll();
    if (query.isEmpty) {
      return all;
    }
    final lowercaseQuery = query.toLowerCase();
    return all.where((proc) {
      final title = proc.title?.get(locale).toLowerCase() ?? '';
      return title.contains(lowercaseQuery);
    }).toList();
  }

  // --- Quiz API ---

  Future<List<QuizQuestion>> getAllQuizQuestions() async {
    final isar = await db;
    return await isar.quizQuestions.where().findAll();
  }

  // --- Regional Directory API ---

  Future<List<RegionalOffice>> getAllRegionalOffices() async {
    final isar = await db;
    return await isar.regionalOffices.where().findAll();
  }

  Future<List<ReferralHospital>> getAllReferralHospitals() async {
    final isar = await db;
    return await isar.referralHospitals.where().findAll();
  }

  Future<List<ReferralHospital>> searchReferralHospitals(String query) async {
    final isar = await db;
    final all = await isar.referralHospitals.where().findAll();
    if (query.isEmpty) {
      return all;
    }
    final lowercaseQuery = query.toLowerCase();
    return all.where((h) {
      final name = h.hospitalName?.toLowerCase() ?? '';
      final region = h.regionName?.toLowerCase() ?? '';
      final county = h.countyName?.toLowerCase() ?? '';
      return name.contains(lowercaseQuery) ||
          region.contains(lowercaseQuery) ||
          county.contains(lowercaseQuery);
    }).toList();
  }

  // --- Telemetry API ---

  Future<void> logEvent(String eventType, Map<String, dynamic> details) async {
    // Check user consent under Kenya Data Protection Act 2019
    final prefs = await SharedPreferences.getInstance();
    final consentGiven = prefs.getBool('telemetry_consent_given') ?? false;
    if (!consentGiven) {
      return; // Do not log telemetry if consent was declined
    }

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
        ..iconName = "ic_cpr_adult"
        ..severityLevel = 1
        ..title = (LocalizedText()
          ..en = "CPR (Adult)"
          ..sw = "Resusitasi - CPR (Mtu Mzima)"
          ..so = "CPR (Dadka Waaweyn)")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_recovery"
            ..instruction = (LocalizedText()
              ..en = "Ensure personal safety first: Wash your hands and wear protective gloves if available."
              ..sw = "Hakikisha usalama wako kwanza: Nawa mikono na uvae glavu za kinga ikiwa zipo."
              ..so = "Hubi badbaadadaada marka hore: Gacmaha maydh oo xidho galoofyada ilaalinta haddii la heli karo."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_phone"
            ..instruction = (LocalizedText()
              ..en = "Call for Help. Ask a bystander to call 1199 and get an AED."
              ..sw = "Piga simu kuomba usaidizi. Mwombe mtu aliye karibu apige simu kwa 1199 na alete kifaa cha AED."
              ..so = "Wac Gurmadka. Weydiiso qof agtaada jooga inuu waco 1199 oo uu keeno aaladda AED."),
          FirstAidStep()
            ..stepOrder = 3
            ..imageResource = "img_cpr_hand"
            ..instruction = (LocalizedText()
              ..en = "Position Hands. Heel of one hand on center of chest. Interlock other on top."
              ..sw = "Weka mikono vizuri. Weka kisigino cha mkono mmoja katikati ya kifua. Weka mkono mwingine juu yake huku ukifunga vidole."
              ..so = "Gacmaha Dhig. Salka hal gacan saar bartamaha laabta. Midda kale dusha ka saar oo faraha isku xidh."),
          FirstAidStep()
            ..stepOrder = 4
            ..imageResource = "img_cpr_compress"
            ..instruction = (LocalizedText()
              ..en = "Compressions. Push hard and fast. Depth 5-6 cm. Rate 100-120 bpm."
              ..sw = "Minyinyo ya Kifua. Bonyeza kwa nguvu na haraka. Kina cha sentimita 5-6. Kasi ya minyinyo 100-120 kwa dakika."
              ..so = "Riixitaanka. Si adag oo dhakhso ah u riix. Qoto dheer 5-6 cm. Kasiyo 100-120 riixitaan daqiiqaddii."),
          FirstAidStep()
            ..stepOrder = 5
            ..imageResource = "img_cpr_breath"
            ..instruction = (LocalizedText()
              ..en = "Rescue Breaths. 30 compressions -> 2 breaths. Tilt head, pinch nose, seal mouth."
              ..sw = "Pumzi ya Uokoaji. Minyinyo 30 kisha pumzi 2. Inua kichwa juu kidogo, finya pua, na uweke kinywa chako kwenye kinywa chake kabisa."
              ..so = "Nefsinta Samatabixinta. 30 riixitaan iyo 2 afuuf. Madaxa xoogaa kor u qaad, sankana tuuji, afkana afka saar."),
          FirstAidStep()
            ..stepOrder = 6
            ..imageResource = "img_cpr_adult_1"
            ..instruction = (LocalizedText()
              ..en = "Repeat. Continue 30:2 cycle until help arrives or breathing starts."
              ..sw = "Rudia. Endelea na mzunguko wa 30:2 hadi msaada utakapofika au mgonjwa aanze kupumua."
              ..so = "Ku celi. Sii wad wareegga 30:2 ilaa garab ka imanayo ama uu neefsashada bilaabo."),
        ],
      Procedure()
        ..iconName = "ic_cpr_baby"
        ..severityLevel = 1
        ..title = (LocalizedText()
          ..en = "CPR (Child/Infant)"
          ..sw = "Resusitasi - CPR (Mtoto)"
          ..so = "CPR (Cunug/Dhallaanka)")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_recovery"
            ..instruction = (LocalizedText()
              ..en = "Ensure personal safety first: Wash your hands and wear protective gloves if available."
              ..sw = "Hakikisha usalama wako kwanza: Nawa mikono na uvae glavu za kinga ikiwa zipo."
              ..so = "Hubi badbaadadaada marka hore: Gacmaha maydh oo xidho galoofyada ilaalinta haddii la heli karo."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_cpr_baby_4"
            ..instruction = (LocalizedText()
              ..en = "Initial Breaths. Give 5 initial rescue breaths before starting compressions."
              ..sw = "Pumzi za Kwanza. Toa pumzi 5 za uokoaji kabla ya kuanza minyinyo ya kifua."
              ..so = "Afuufka Hore. Sii 5 afuuf oo samatabixin ah ka hor inta aanad bilaabin riixitaanka."),
          FirstAidStep()
            ..stepOrder = 3
            ..imageResource = "img_cpr_baby_2"
            ..instruction = (LocalizedText()
              ..en = "Position Hands. Infant: 2 fingers. Child: 1 hand heel."
              ..sw = "Nafasi ya Mikono. Mtoto mchanga: vidole 2. Mtoto mkubwa: kisigino cha mkono mmoja."
              ..so = "Meeleynta Gacmaha. Dhallaanka: 2 farood. Cunugga: salka hal gacan."),
          FirstAidStep()
            ..stepOrder = 4
            ..imageResource = "img_cpr_baby_3"
            ..instruction = (LocalizedText()
              ..en = "Compressions. Press down 1/3 depth. Rate 100-120 bpm."
              ..sw = "Minyinyo. Bonyeza chini kwa kina cha 1/3 ya kifua. Kasi ya minyinyo 100-120 kwa dakika."
              ..so = "Riixitaanka. Hoos u riix 1/3 qoto dheer. Kasiyo 100-120 riixitaan daqiiqaddii."),
          FirstAidStep()
            ..stepOrder = 5
            ..imageResource = "img_phone"
            ..instruction = (LocalizedText()
              ..en = "Call 1199. If alone, perform CPR for 1 minute before leaving to call."
              ..sw = "Piga 1199. Ikiwa uko peke yako, fanya CPR kwa dakika 1 kabla ya kuondoka kwenda kupiga simu."
              ..so = "Wac 1199. Haddii aad kaligaa tahay, samee CPR muddo 1 daqiiqo ah ka hor inta aanad wicin."),
        ],
      Procedure()
        ..iconName = "ic_choking"
        ..severityLevel = 1
        ..title = (LocalizedText()
          ..en = "Choking"
          ..sw = "Kukabwa Koo / Kikohozi"
          ..so = "Neefta oo Caburta")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_choking_2"
            ..instruction = (LocalizedText()
              ..en = "Back Blows. Give up to 5 sharp blows between shoulder blades."
              ..sw = "Mabapa ya Mgongoni. Toa hadi mapigo 5 makali kati ya mabega ya mgongo."
              ..so = "Dharbaaxada Dhabarka. Sii ilaa 5 dharbaaxo oo xooggan inta u dhaxeysa garbaha dhabarka."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_choking_3"
            ..instruction = (LocalizedText()
              ..en = "Abdominal Thrusts. Fist above navel. Pull sharply inward and upward."
              ..sw = "Minyinyo ya Tumbo. Weka ngumi juu ya kitovu. Vuta kwa nguvu kuelekea ndani na juu."
              ..so = "Riixitaanka Caloosha. Feedh saar xuddunta dushaeda. Si xoog leh gudaha iyo kor u soo jiid."),
          FirstAidStep()
            ..stepOrder = 3
            ..imageResource = "img_choking_4"
            ..instruction = (LocalizedText()
              ..en = "Repeat. Cycle 5 back blows and 5 abdominal thrusts."
              ..sw = "Rudia. Endelea na mzunguko wa mapigo 5 ya mgongo na minyinyo 5 ya tumbo."
              ..so = "Ku celi. Wareegga 5 dharbaaxo dhabarka ah iyo 5 riixitaan caloosha ah."),
        ],
      Procedure()
        ..iconName = "ic_bleeding"
        ..severityLevel = 1
        ..title = (LocalizedText()
          ..en = "Severe Bleeding"
          ..sw = "Kuvuja Damu Sana"
          ..so = "Dhiigbax Halis ah")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_recovery"
            ..instruction = (LocalizedText()
              ..en = "Protect Yourself. Wash hands and wear protective gloves if available."
              ..sw = "Jilinde Mwenyewe. Nawa mikono na uvae glavu za kinga ikiwa zipo."
              ..so = "Isku ilaali. Wash gacmaha oo xidho galoofyada ilaalinta haddii la heli karo."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_bleeding_1"
            ..instruction = (LocalizedText()
              ..en = "Direct Pressure. Apply firm pressure using sterile dressing."
              ..sw = "Minyo ya Moja kwa Moja. Weka shinikizo thabiti kwa kutumia kitambaa safi kilichotibiwa (sterile)."
              ..so = "Cadaadis Toos ah. Si adag u cadaadi adoo isticmaalaya maro nadiif ah."),
          FirstAidStep()
            ..stepOrder = 3
            ..imageResource = "img_bleeding_2"
            ..instruction = (LocalizedText()
              ..en = "Elevate. Raise injured limb above heart level."
              ..sw = "Inua Juu. Kuinua kiungo kilichojeruhiwa juu ya kiwango cha moyo."
              ..so = "Koryeel. Kor u qaad addinka dhaawacmay si uu uga sarreeyo heerka wadnaha."),
          FirstAidStep()
            ..stepOrder = 4
            ..imageResource = "img_bleeding_3"
            ..instruction = (LocalizedText()
              ..en = "Bandage. Secure dressing tight but don't stop circulation."
              ..sw = "Funga Bendeji. Funga kitambaa vizuri lakini usizuie mzunguko wa damu."
              ..so = "Faashad. Ku duub faashad si adag laakiin ha joojin wareegga dhiigga."),
        ],
      Procedure()
        ..iconName = "ic_burns"
        ..severityLevel = 1
        ..title = (LocalizedText()
          ..en = "Burns & Scalds"
          ..sw = "Majeraha ya Moto"
          ..so = "Gubashada")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_burns_cover"
            ..instruction = (LocalizedText()
              ..en = "Stop the Burning. Move away from heat source. Put out flames."
              ..sw = "Zuia Moto. Ondoka kwenye chanzo cha moto. Zima miali ya moto."
              ..so = "Jooji Gubashada. Ka fogow meesha kulaylka. Demi ololka."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_burns_1"
            ..instruction = (LocalizedText()
              ..en = "Cool the Burn. Cool running tepid water for 20 mins. NO ICE."
              ..sw = "Poza Eneo. Mimina maji ya bomba yenye baridi kiasi kwa dakika 20. USIWEKE BARAFU."
              ..so = "Qabooji Gubashada. Ku shub biyo qabow muddo 20 daqiiqo ah. Baraf HA ISTICMAALIN."),
          FirstAidStep()
            ..stepOrder = 3
            ..imageResource = "img_burns_no"
            ..instruction = (LocalizedText()
              ..en = "Cover. Cover loosely with cling film or sterile non-fluffy dressing."
              ..sw = "Funika. Funika kwa urahisi kwa kutumia karatasi ya plastiki au bendeji safi isiyo na nyuzi."
              ..so = "Dabool. Si dabacsan ugu dabool faashad nadiif ah."),
        ],
      Procedure()
        ..iconName = "ic_fracture"
        ..severityLevel = 2
        ..title = (LocalizedText()
          ..en = "Fractures"
          ..sw = "Mifupa Iliyovunjika"
          ..so = "Jabniinka lafaha")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_fracture_1"
            ..instruction = (LocalizedText()
              ..en = "Immobilize. Support injury with hand or use padding/slings."
              ..sw = "Zuia Kusonga. Tegemeza jeraha kwa mkono au utumie vitambaa vya kuegemeza."
              ..so = "Ha dhaqaajin. Ku taageer dhaawaca gacan ama isticmaal maro wax lagu qaado."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_fracture_2"
            ..instruction = (LocalizedText()
              ..en = "Splinting. Secure injured limb to a sound part of the body."
              ..sw = "Kuweka Kifaa. Funga kiungo kilichoumia kwenye sehemu nyingine nzuri ya mwili ili kuzuia kusonga."
              ..so = "Ku xidh qori. Ku xidh addinka dhaawacmay meel kale oo caafimaad qabta oo jidhka ah."),
        ],
      Procedure()
        ..iconName = "ic_seizure"
        ..severityLevel = 2
        ..title = (LocalizedText()
          ..en = "Seizures"
          ..sw = "Kifafa / Degedege"
          ..so = "Suuxdin / Qallal")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_seizure_1"
            ..instruction = (LocalizedText()
              ..en = "Safety. Move dangerous objects away. Do not restrain."
              ..sw = "Usalama. Ondoa vitu vyote hatari karibu naye. Usimshikilie kwa nguvu."
              ..so = "Badbaadada. Ka fogow walxaha khatarta ah. Ha isku dayin inaad xajiso."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_seizure_2"
            ..instruction = (LocalizedText()
              ..en = "Protect the Head. Place something soft under their head."
              ..sw = "Linda Kichwa. Weka kitu laini chini ya kichwa chake."
              ..so = "Difaac Madaxa. Wax jilicsan hoos dhig madaxiisa."),
        ],
      Procedure()
        ..iconName = "ic_snake"
        ..severityLevel = 1
        ..title = (LocalizedText()
          ..en = "Snake Bites"
          ..sw = "Kung'atwa na Nyoka"
          ..so = "Qaniinyada Maska")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_snake_no"
            ..instruction = (LocalizedText()
              ..en = "Ensure personal safety: Keep at a safe distance from the snake."
              ..sw = "Hakikisha usalama wako: Kaa umbali salama na nyoka."
              ..so = "Hubi badbaadadaada: Ka fogow maska masaafo badbaado leh."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_snake_1"
            ..instruction = (LocalizedText()
              ..en = "Stay Calm. Reassure patient. Panic spreads venom."
              ..sw = "Tulia. Mtulize mgonjwa. Mshtuko na hofu hueneza sumu haraka mwilini."
              ..so = "Isdeji. Deji bukaanka. Argagaxu wuxuu dedejiyaa faafidda sunta."),
          FirstAidStep()
            ..stepOrder = 3
            ..imageResource = "img_snake_2"
            ..instruction = (LocalizedText()
              ..en = "Immobilize. Keep limb still and below heart level."
              ..sw = "Zuia Kusonga. Weka kiungo kilichong'atwa kikiwa kimetulia na chini ya kiwango cha moyo."
              ..so = "Ha dhaqaajin. Addinka ku hay meel degan oo ka hooseysa heerka wadnaha."),
          FirstAidStep()
            ..stepOrder = 4
            ..imageResource = "img_ambulance"
            ..instruction = (LocalizedText()
              ..en = "Call 1199. Transport to hospital immediately. NO sucking venom."
              ..sw = "Piga 1199. Mpeleke hospitalini haraka. USINYONYE sumu kwa mdomo."
              ..so = "Wac 1199. U qaad isbitaalka si degdeg ah. HA nuugin sunta."),
        ],
      Procedure()
        ..iconName = "ic_poison"
        ..severityLevel = 1
        ..title = (LocalizedText()
          ..en = "Poisoning"
          ..sw = "Sumu"
          ..so = "Sumowga")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_poison_1"
            ..instruction = (LocalizedText()
              ..en = "Safety Check. Ensure you are not exposed to poison."
              ..sw = "Ukaguzi wa Usalama. Hakikisha kuwa wewe pia hauko katika hatari ya sumu hiyo."
              ..so = "Hubi badbaadadaada. Iska ilaali inaad adiguna sumowdo."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_phone"
            ..instruction = (LocalizedText()
              ..en = "Call 1199. Follow dispatcher's advice. NO vomiting unless told."
              ..sw = "Piga 1199. Fuata ushauri wa mhudumu wa simu. USIMSABABISHE kutapika isipokuwa ukiambiwa."
              ..so = "Wac 1199. Raac talada dhakhtarka. Ha ku qasbin inuu matago haddii aan laguu sheegin."),
        ],
      Procedure()
        ..iconName = "ic_heart"
        ..severityLevel = 1
        ..title = (LocalizedText()
          ..en = "Heart Attack"
          ..sw = "Shambulio la Moyo"
          ..so = "Garaaca Wadnaha oo Istaaga")
        ..steps = [
          FirstAidStep()
            ..stepOrder = 1
            ..imageResource = "img_phone"
            ..instruction = (LocalizedText()
              ..en = "Call 1199 Immediately. This is a medical emergency."
              ..sw = "Piga 1199 Haraka Sana. Hii ni dharura kubwa ya matibabu."
              ..so = "Wac 1199 Degdeg. Tani waa xaalad degdeg ah oo caafimaad."),
          FirstAidStep()
            ..stepOrder = 2
            ..imageResource = "img_heart_sit"
            ..instruction = (LocalizedText()
              ..en = "Position. Sit down, knees bent, head supported (W Position)."
              ..sw = "Kaa Nafasi Nzuri. Mketishe chini, magoti yakiwa yamevunjwa na kichwa kikiegemea (Nafasi ya W)."
              ..so = "Fadhiisi. Fadhiisi bukaanka, jilbaha u laab, madaxana u tiiri (Habka W)."),
          FirstAidStep()
            ..stepOrder = 3
            ..imageResource = "img_aspirin"
            ..instruction = (LocalizedText()
              ..en = "Medication. Chew 300mg Aspirin if not allergic."
              ..sw = "Dawa. Tafuna Aspirini ya miligramu 300 ikiwa hana mzio (allergic)."
              ..so = "Daawo. Sii xabbad Aspirin 300mg ah si uu u calaaliyo haddii aanu xasaasiyad u lahayn."),
        ],
    ];
  }

  List<QuizQuestion> _getInitialQuizQuestions() {
    return [
      QuizQuestion()
        ..correctOptionIndex = 1
        ..question = (LocalizedText()
          ..en = "What is the correct ratio of chest compressions to rescue breaths for Adult CPR?"
          ..sw = "Ni upi uwiano sahihi wa minyinyo ya kifua kwa pumzi za uokoaji kwa CPR ya Mtu Mzima?"
          ..so = "Waa maxay saamiga saxda ah ee riixitaanka laabta iyo afuufka ee CPR-ta Dadka Waaweyn?")
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
        ..optionsSo = [
          "15 riixitaan : 2 afuuf",
          "30 riixitaan : 2 afuuf",
          "30 riixitaan : 5 afuuf",
          "Riixitaan joogto ah oo keliya"
        ]
        ..explanation = (LocalizedText()
          ..en = "30 compressions to 2 breaths is the standard ratio."
          ..sw = "Minyinyo 30 kwa pumzi 2 ndio uwiano sahihi wa kawaida."
          ..so = "30 riixitaan iyo 2 afuuf ayaa ah halbeegga rasmiga ah."),
      QuizQuestion()
        ..correctOptionIndex = 1
        ..question = (LocalizedText()
          ..en = "In Kenya, what is the primary emergency number for medical dispatch?"
          ..sw = "Nchini Kenya, ni nambari gani kuu ya dharura ya huduma ya ambulansi ya matibabu?"
          ..so = "Dalka Kenya, waa maxay lambarka gurmadka degdegga ah ee caafimaadka?")
        ..optionsEn = ["911", "1199", "999", "211"]
        ..optionsSw = ["911", "1199", "999", "211"]
        ..optionsSo = ["911", "1199", "999", "211"]
        ..explanation = (LocalizedText()
          ..en = "1199 is the Kenya Red Cross EPlus ambulance service number."
          ..sw = "1199 ni nambari ya simu ya dharura ya Kenya Red Cross EPlus."
          ..so = "1199 waa lambarka gurmadka ee Ururka Bisha Cas ee Kenya EPlus."),
    ];
  }

  List<RegionalOffice> _getInitialRegionalOffices() {
    return [
      RegionalOffice()
        ..regionName = "Northern Region"
        ..countyName = "Garissa"
        ..locationName = "Garissa Branch Office"
        ..contactPhone = "+254 722 000 001",
      RegionalOffice()
        ..regionName = "Northern Region"
        ..countyName = "Wajir"
        ..locationName = "Wajir Branch Office"
        ..contactPhone = "+254 722 000 002",
      RegionalOffice()
        ..regionName = "Northern Region"
        ..countyName = "Mandera"
        ..locationName = "Mandera Branch Office"
        ..contactPhone = "+254 722 000 003",
      RegionalOffice()
        ..regionName = "Northern Region"
        ..countyName = "Garissa"
        ..locationName = "Dadaab Field Office"
        ..contactPhone = "+254 722 000 004",
      RegionalOffice()
        ..regionName = "Nairobi Region"
        ..countyName = "Nairobi"
        ..locationName = "KRCS Headquarters / Emergency Operations Center"
        ..contactPhone = "1199",
    ];
  }

  List<ReferralHospital> _getInitialReferralHospitals() {
    return [
      ReferralHospital()
        ..hospitalName = "Garissa County Referral Hospital"
        ..regionName = "Northern Region"
        ..countyName = "Garissa"
        ..capabilityTier = "Level 5 General Hospital"
        ..contactPhone = "+254 46 2102555",
      ReferralHospital()
        ..hospitalName = "Wajir County Referral Hospital"
        ..regionName = "Northern Region"
        ..countyName = "Wajir"
        ..capabilityTier = "Level 4 Hospital"
        ..contactPhone = "+254 46 421028",
      ReferralHospital()
        ..hospitalName = "Mandera County Referral Hospital"
        ..regionName = "Northern Region"
        ..countyName = "Mandera"
        ..capabilityTier = "Level 4 Hospital"
        ..contactPhone = "+254 46 310214",
      ReferralHospital()
        ..hospitalName = "Dadaab Refugee Camp IFRC Clinic"
        ..regionName = "Northern Region"
        ..countyName = "Garissa (Dadaab)"
        ..capabilityTier = "IFRC Humanitarian Medical Unit"
        ..contactPhone = "+254 700 000 000",
      ReferralHospital()
        ..hospitalName = "Kenyatta National Hospital"
        ..regionName = "Nairobi Region"
        ..countyName = "Nairobi"
        ..capabilityTier = "Level 6 National Referral Hospital"
        ..contactPhone = "+254 20 2726300",
    ];
  }
}
