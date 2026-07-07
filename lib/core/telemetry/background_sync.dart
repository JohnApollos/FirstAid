import 'package:flutter/widgets.dart';
import 'package:workmanager/workmanager.dart';
import '../database/isar_service.dart';
import '../network/supabase_service.dart';

const String telemetrySyncTaskName = "com.example.firstaid.telemetrySyncTask";

/// Callback dispatcher for the Workmanager background task worker.
/// This runs in a separate isolate and executes offline-to-online sync operations.
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized(); // Initialize native channels for background thread
    try {
      final isarService = IsarService();
      final supabaseService = SupabaseService();
      await supabaseService.initialize();

      // Fetch all unsynced telemetry logs from Isar local storage
      final unsyncedLogs = await isarService.getUnsyncedTelemetry();
      if (unsyncedLogs.isEmpty) {
        return true;
      }

      // Batch upload logs to Supabase
      final syncSuccess = await supabaseService.uploadTelemetry(unsyncedLogs);
      if (syncSuccess) {
        // Mark logs as synced in local DB upon verified network receipt
        final ids = unsyncedLogs.map((log) => log.id).toList();
        await isarService.markTelemetryAsSynced(ids);
      }
      
      return syncSuccess;
    } catch (e) {
      print('Background telemetry sync task crashed: $e');
      return false;
    }
  });
}

/// Helper class to initialize and register the background telemetry sync tasks.
class BackgroundSync {
  /// Initializes the background worker.
  static Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false,
    );
  }

  /// Registers a periodic sync task constraints: Wi-Fi (unmetered) and charging.
  static void registerPeriodicSync() {
    Workmanager().registerPeriodicTask(
      "1",
      telemetrySyncTaskName,
      frequency: const Duration(hours: 1), // Checks every hour (OS minimum limits apply)
      constraints: Constraints(
        networkType: NetworkType.unmetered, // Runs only on Wi-Fi
        requiresCharging: true,            // Runs only when device is charging
      ),
    );
  }
}
