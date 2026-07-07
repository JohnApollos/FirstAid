import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/isar_service.dart';
import '../network/supabase_service.dart';
import '../services/location_service.dart';
import '../services/metronome_service.dart';

// Service Providers
final isarServiceProvider = Provider<IsarService>((ref) => IsarService());
final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  final service = SupabaseService();
  service.initialize();
  return service;
});
final locationServiceProvider = Provider<LocationService>((ref) => LocationService());
final metronomeServiceProvider = Provider<MetronomeService>((ref) => MetronomeService());

// Locale State Provider
class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en'));

  void toggleLocale() {
    if (state.languageCode == 'en') {
      state = const Locale('sw');
    } else if (state.languageCode == 'sw') {
      state = const Locale('so');
    } else {
      state = const Locale('en');
    }
  }

  void setLocale(Locale locale) {
    state = locale;
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
