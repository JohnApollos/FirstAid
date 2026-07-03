import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.aboutTab),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // App Logo and Header Brand
            const Center(
              child: Column(
                children: [
                  Icon(Icons.health_and_safety, size: 72, color: Colors.red),
                  SizedBox(height: 12),
                  Text(
                    "FirstAid+",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 1. The Legal Liability Shield (At the very top, high contrast red warning card)
            Card(
              color: const Color(0xFFFFF1F1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFFD32F2F), width: 1.5),
              ),
              elevation: 2,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.gavel, color: Color(0xFFD32F2F)),
                        SizedBox(width: 8),
                        Text(
                          "LEGAL MEDICAL DISCLAIMER",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD32F2F),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "FirstAid+ is an operational prototype developed for the Kenya Red Cross Innovation Challenge 2026. The medical protocols contained within this application have not yet been independently verified by a certified medical board. This application is not a substitute for professional medical training or emergency dispatch protocols. Always yield to certified paramedics when they arrive on the scene.",
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 2. Mission & Version Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mission & Version",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900],
                      ),
                    ),
                    const Divider(height: 20),
                    const Text(
                      "Version: 2.0.0",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Mission: To provide zero-latency, offline-first emergency medical guidance and background health telemetry for rural network blackspots.",
                      style: TextStyle(fontSize: 14, height: 1.4, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 3. Development Team Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Apollos Digital Solutions Venture Team",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900],
                      ),
                    ),
                    const Divider(height: 20),
                    _buildVentureMember(
                      name: "John Apollos Olal",
                      role: "Lead Software Engineer & Data Scientist",
                      desc: "Responsible for the cross-platform Flutter architecture, NoSQL database engineering, and offline telemetry pipeline.",
                    ),
                    const SizedBox(height: 16),
                    _buildVentureMember(
                      name: "Joseph Lperen Arigele",
                      role: "Ventures Strategist & Regional Liaison",
                      desc: "Responsible for operational deployment, Red Cross partnership alignment, and Marsabit County integration strategy.",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 4. Technical Architecture Card (For Judges)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Technical Architecture",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900],
                      ),
                    ),
                    const Divider(height: 20),
                    _buildArchitectureRow(
                      component: "Frontend",
                      detail: "Built with Flutter for zero-latency native ARM execution.",
                    ),
                    const SizedBox(height: 10),
                    _buildArchitectureRow(
                      component: "Storage",
                      detail: "Powered by a local offline-first Isar NoSQL database for instant full-text protocol searches.",
                    ),
                    const SizedBox(height: 10),
                    _buildArchitectureRow(
                      component: "Analytics",
                      detail: "Utilizes an encrypted background worker to silently sync telemetry data to a centralized PostgreSQL infrastructure when unmetered network access is restored.",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildVentureMember({required String name, required String role, required String desc}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          role,
          style: const TextStyle(fontSize: 13, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          desc,
          style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildArchitectureRow({required String component, required String detail}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.code, size: 20, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black87, fontSize: 13, height: 1.4),
              children: [
                TextSpan(
                  text: "$component: ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: detail),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
