import 'package:isar/isar.dart';

part 'telemetry_log.g.dart';

@collection
class TelemetryLog {
  Id id = Isar.autoIncrement;

  late DateTime timestamp;

  @Index(type: IndexType.value)
  late String eventType; // e.g. "search", "view_procedure", "quiz_attempt"

  late String details; // JSON payload

  @Index()
  late bool synced;
}
