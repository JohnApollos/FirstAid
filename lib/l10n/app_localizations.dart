import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sw.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sw'),
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'FirstAid+'**
  String get appName;

  /// No description provided for @emergencyCall.
  ///
  /// In en, this message translates to:
  /// **'🚨 EMERGENCY CALL (1199)'**
  String get emergencyCall;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search Emergency...'**
  String get searchHint;

  /// No description provided for @homeTab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTab;

  /// No description provided for @quizTab.
  ///
  /// In en, this message translates to:
  /// **'Quiz'**
  String get quizTab;

  /// No description provided for @aboutTab.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTab;

  /// No description provided for @cprMetronome.
  ///
  /// In en, this message translates to:
  /// **'CPR Metronome'**
  String get cprMetronome;

  /// No description provided for @startMetronome.
  ///
  /// In en, this message translates to:
  /// **'Start Metronome'**
  String get startMetronome;

  /// No description provided for @stopMetronome.
  ///
  /// In en, this message translates to:
  /// **'Stop Metronome'**
  String get stopMetronome;

  /// No description provided for @liveGps.
  ///
  /// In en, this message translates to:
  /// **'Live GPS Coordinates'**
  String get liveGps;

  /// No description provided for @latitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get latitude;

  /// No description provided for @longitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get longitude;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @copyLocation.
  ///
  /// In en, this message translates to:
  /// **'Copy Location'**
  String get copyLocation;

  /// No description provided for @shareLocation.
  ///
  /// In en, this message translates to:
  /// **'Share Location'**
  String get shareLocation;

  /// No description provided for @highScore.
  ///
  /// In en, this message translates to:
  /// **'High Score: {score}'**
  String highScore(int score);

  /// No description provided for @questionCount.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String questionCount(int current, int total);

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct!'**
  String get correct;

  /// No description provided for @wrong.
  ///
  /// In en, this message translates to:
  /// **'Wrong!'**
  String get wrong;

  /// No description provided for @quizFeedbackPrepared.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You are officially prepared.'**
  String get quizFeedbackPrepared;

  /// No description provided for @quizFeedbackReview.
  ///
  /// In en, this message translates to:
  /// **'Good effort! Review the guides to improve your score.'**
  String get quizFeedbackReview;

  /// No description provided for @quizFeedbackStudy.
  ///
  /// In en, this message translates to:
  /// **'Keep studying! Safety first.'**
  String get quizFeedbackStudy;

  /// No description provided for @restartQuiz.
  ///
  /// In en, this message translates to:
  /// **'Restart Quiz'**
  String get restartQuiz;

  /// No description provided for @goHome.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get goHome;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version 2.0.0 (Beta)'**
  String get version;

  /// No description provided for @aboutDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'FirstAid+ provides offline-first emergency guides based on standard medical guidelines. It does not constitute professional medical advice, diagnosis, or treatment. In a life-threatening emergency, always prioritize calling professional emergency services (1199/999/112).'**
  String get aboutDisclaimer;

  /// No description provided for @aboutAcknowledgements.
  ///
  /// In en, this message translates to:
  /// **'Special thanks to the JKUAT Department of Computing & IT for their initial support.'**
  String get aboutAcknowledgements;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language / Lugha'**
  String get languageLabel;

  /// No description provided for @confirmButton.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM'**
  String get confirmButton;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'NEXT'**
  String get nextButton;

  /// No description provided for @finishButton.
  ///
  /// In en, this message translates to:
  /// **'FINISH'**
  String get finishButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'sw'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'sw':
      return AppLocalizationsSw();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
