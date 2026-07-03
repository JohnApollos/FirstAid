import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firstaid/l10n/app_localizations.dart';
import 'core/providers/providers.dart';
import 'core/theme/theme.dart';
import 'features/main_navigation_shell.dart';
import 'core/telemetry/background_sync.dart';

void main() {
  // Ensure native bindings are initialized before app startup
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize and register background telemetry sync tasks
  BackgroundSync.initialize();
  BackgroundSync.registerPeriodicSync();
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeLocale = ref.watch(localeProvider);

    return MaterialApp(
      title: 'FirstAid+',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      
      // Dynamic Locale bindings
      locale: activeLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('sw', ''), // Swahili (Kiswahili)
      ],
      
      home: const MainNavigationShell(),
    );
  }
}
