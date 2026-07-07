import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firstaid/l10n/app_localizations.dart';
import '../core/utils/consent_dialog.dart';
import 'home/home_screen.dart';
import 'emergency/emergency_screen.dart';
import 'training/training_screen.dart';
import 'about/about_screen.dart';

// State provider to manage the active bottom navigation tab index
final navigationIndexProvider = StateProvider<int>((ref) => 0);

class MainNavigationShell extends ConsumerStatefulWidget {
  const MainNavigationShell({super.key});

  @override
  ConsumerState<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends ConsumerState<MainNavigationShell> {
  @override
  void initState() {
    super.initState();
    // Launch the trilingual privacy consent dialog on first launch
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ConsentDialog.showIfNeeded(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeTabIdx = ref.watch(navigationIndexProvider);
    final l10n = AppLocalizations.of(context)!;

    final List<Widget> screens = [
      const HomeScreen(),
      const EmergencyScreen(),
      const TrainingScreen(),
      const AboutScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: activeTabIdx,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeTabIdx,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red[700],
        unselectedItemColor: Colors.grey[600],
        onTap: (idx) {
          ref.read(navigationIndexProvider.notifier).state = idx;
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n.homeTab,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.emergency),
            label: l10n.emergencyCall.replaceAll(RegExp(r'[^a-zA-Z0-9\(\)]'), '').trim(), // Remove emoji from labels
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.school),
            label: l10n.quizTab,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info),
            label: l10n.aboutTab,
          ),
        ],
      ),
    );
  }
}
