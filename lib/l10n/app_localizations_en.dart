// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'FirstAid+';

  @override
  String get emergencyCall => '🚨 EMERGENCY CALL (1199)';

  @override
  String get searchHint => 'Search Emergency...';

  @override
  String get homeTab => 'Home';

  @override
  String get quizTab => 'Quiz';

  @override
  String get aboutTab => 'About';

  @override
  String get cprMetronome => 'CPR Metronome';

  @override
  String get startMetronome => 'Start Metronome';

  @override
  String get stopMetronome => 'Stop Metronome';

  @override
  String get liveGps => 'Live GPS Coordinates';

  @override
  String get latitude => 'Latitude';

  @override
  String get longitude => 'Longitude';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get copyLocation => 'Copy Location';

  @override
  String get shareLocation => 'Share Location';

  @override
  String highScore(int score) {
    return 'High Score: $score';
  }

  @override
  String questionCount(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get correct => 'Correct!';

  @override
  String get wrong => 'Wrong!';

  @override
  String get quizFeedbackPrepared =>
      'Congratulations! You are officially prepared.';

  @override
  String get quizFeedbackReview =>
      'Good effort! Review the guides to improve your score.';

  @override
  String get quizFeedbackStudy => 'Keep studying! Safety first.';

  @override
  String get restartQuiz => 'Restart Quiz';

  @override
  String get goHome => 'Go Home';

  @override
  String get version => 'Version 2.0.0 (Beta)';

  @override
  String get aboutDisclaimer =>
      'FirstAid+ provides offline-first emergency guides based on standard medical guidelines. It does not constitute professional medical advice, diagnosis, or treatment. In a life-threatening emergency, always prioritize calling professional emergency services (1199/999/112).';

  @override
  String get aboutAcknowledgements =>
      'Special thanks to the JKUAT Department of Computing & IT for their initial support.';

  @override
  String get languageLabel => 'Language / Lugha';

  @override
  String get confirmButton => 'CONFIRM';

  @override
  String get nextButton => 'NEXT';

  @override
  String get finishButton => 'FINISH';
}
