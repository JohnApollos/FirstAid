import 'package:shared_preferences/shared_preferences.dart';

/// Service class to manage user telemetry logging consent flags
/// in full compliance with the Kenya Data Protection Act (KDPA) 2019.
class ConsentService {
  static const String _consentKey = 'telemetry_consent_given';
  static const String _consentDecidedKey = 'telemetry_consent_decided';

  /// Returns true if the user has already accepted or declined the privacy prompt.
  static Future<bool> hasDecided() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_consentDecidedKey) ?? false;
  }

  /// Returns true if telemetry logging is allowed.
  static Future<bool> isConsentGiven() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_consentKey) ?? false;
  }

  /// Records the user's consent choice.
  static Future<void> saveConsent(bool given) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_consentKey, given);
    await prefs.setBool(_consentDecidedKey, true);
  }
}
