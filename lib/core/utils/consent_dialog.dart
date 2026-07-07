import 'package:flutter/material.dart';
import '../services/consent_service.dart';

/// Onboarding privacy consent modal conforming to the Kenya Data Protection Act 2019.
class ConsentDialog extends StatelessWidget {
  const ConsentDialog({super.key});

  static Future<void> showIfNeeded(BuildContext context) async {
    final decided = await ConsentService.hasDecided();
    if (!decided && context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const ConsentDialog(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back button bypass
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.security, color: Colors.red),
            SizedBox(width: 8),
            Text(
              "Privacy Consent",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "English",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                "FirstAid+ collects anonymized usage metrics (searches, quiz scores) to assist Kenya Red Cross Society regional planners. We never collect personal identities or location history. Do you consent to telemetry logging?",
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
              Divider(height: 24),
              Text(
                "Kiswahili",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                "FirstAid+ hukusanya takwimu zisizotambuliwa (utafutaji, dharura) ili kusaidia upangaji wa huduma za Kenya Red Cross. Hatukusanyi jina lako au mahali ulipo. Je, unatoa kibali cha kukusanya takwimu hizi?",
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
              Divider(height: 24),
              Text(
                "Somali",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                "FirstAid+ wuxuu ururiyaa xog aan laguu aqoonsan karin si loo caawiyo qorsheynta gurmadka degdegga ah ee Bisha Cas ee Kenya. Marnaba ma ururinno magacaaga ama goobtaada. Ma ogolaanaysaa ururinta xogtan?",
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await ConsentService.saveConsent(false);
              if (context.mounted) Navigator.of(context).pop();
            },
            child: const Text(
              "DECLINE / KATAA / DIID",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () async {
              await ConsentService.saveConsent(true);
              if (context.mounted) Navigator.of(context).pop();
            },
            child: const Text(
              "ACCEPT / KUBALI / OGOLOW",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
