// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appName => 'FirstAid+';

  @override
  String get emergencyCall => '🚨 PIGA SIMU (1199)';

  @override
  String get searchHint => 'Tafuta Huduma ya Dharura...';

  @override
  String get homeTab => 'Mwanzo';

  @override
  String get quizTab => 'Maswali';

  @override
  String get aboutTab => 'Kuhusu';

  @override
  String get cprMetronome => 'Metronomu ya CPR';

  @override
  String get startMetronome => 'Anza Metronomu';

  @override
  String get stopMetronome => 'Zima Metronomu';

  @override
  String get liveGps => 'Kuratibu za GPS Moja kwa Moja';

  @override
  String get latitude => 'Latitudo';

  @override
  String get longitude => 'Longitudo';

  @override
  String get accuracy => 'Usahihi';

  @override
  String get copyLocation => 'Nakili Mahali';

  @override
  String get shareLocation => 'Shiriki Mahali';

  @override
  String highScore(int score) {
    return 'Alama za Juu: $score';
  }

  @override
  String questionCount(int current, int total) {
    return 'Swali la $current kati ya $total';
  }

  @override
  String get correct => 'Sahihi!';

  @override
  String get wrong => 'Si Sahihi!';

  @override
  String get quizFeedbackPrepared => 'Hongera! Umejitayarisha rasmi.';

  @override
  String get quizFeedbackReview =>
      'Juhudi nzuri! Pitia miongozo ili kuboresha alama zako.';

  @override
  String get quizFeedbackStudy => 'Endelea kusoma! Usalama kwanza.';

  @override
  String get restartQuiz => 'Anza Tena Maswali';

  @override
  String get goHome => 'Rudi Nyumbani';

  @override
  String get version => 'Toleo la 2.0.0 (Beta)';

  @override
  String get aboutDisclaimer =>
      'FirstAid+ hutoa miongozo ya dharura ya nje ya mtandao kulingana na miongozo ya kawaida ya matibabu. Haichukui nafasi ya ushauri wa kitaalamu wa matibabu, utambuzi, au matibabu. Katika hali ya hatari ya maisha, kila wakati weka kipaumbele kupigia simu huduma za dharura za kitaalamu (1199/999/112).';

  @override
  String get aboutAcknowledgements =>
      'Shukrani za pekee kwa Idara ya Kompyuta na Teknolojia ya Habari ya JKUAT kwa msaada wao wa kwanza.';

  @override
  String get languageLabel => 'Lugha / Language';

  @override
  String get confirmButton => 'THIBITISHA';

  @override
  String get nextButton => 'INAYOFUATA';

  @override
  String get finishButton => 'MALIZA';
}
