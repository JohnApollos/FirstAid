import 'package:supabase_flutter/supabase_flutter.dart';
import '../database/models/telemetry_log.dart';

/// Service class to manage all network operations with Supabase.
/// Includes fallback error handling to support offline-first execution.
class SupabaseService {
  static const String _supabaseUrl = 'https://klxodhwmaxydflzlpmek.supabase.co';
  static const String _supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtseG9kaHdtYXh5ZGZsemxwbWVrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODMzMjA0MDAsImV4cCI6MjA5ODg5NjQwMH0.q44FR8ATMvTPizHEb3LopvQ7CFuzGQOddjrD7IMUlTI';

  bool _initialized = false;

  /// Initializes the Supabase client. Wraps in a try-catch to prevent offline crashes.
  Future<void> initialize() async {
    try {
      // Initialize with placeholder keys. In production, these should be replaced
      // with real environment configurations.
      await Supabase.initialize(
        url: _supabaseUrl,
        anonKey: _supabaseAnonKey,
      );
      _initialized = true;
    } catch (e) {
      // Log error silently. The app is offline-first and will function normally.
      print('Supabase initialization failed: $e');
      _initialized = false;
    }
  }

  /// Uplinks telemetry logs to Supabase PostgreSQL backend in batches.
  /// Returns true if the upload was successful.
  Future<bool> uploadTelemetry(List<TelemetryLog> logs) async {
    if (!_initialized) {
      return false;
    }

    try {
      final client = Supabase.instance.client;
      
      // Convert Isar TelemetryLogs to Map format for insertion
      final data = logs.map((log) => {
        'id': log.id,
        'timestamp': log.timestamp.toIso8601String(),
        'event_type': log.eventType,
        'details': log.details,
      }).toList();

      // Perform batch insert into the 'telemetry_logs' table
      await client.from('telemetry_logs').insert(data);
      return true;
    } catch (e) {
      print('Failed to sync telemetry to Supabase: $e');
      return false;
    }
  }
}
