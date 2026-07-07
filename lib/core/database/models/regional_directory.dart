import 'package:isar/isar.dart';

part 'regional_directory.g.dart';

@collection
class RegionalOffice {
  Id id = Isar.autoIncrement;
  String? regionName;
  String? countyName;
  String? locationName;
  String? contactPhone;
}

@collection
class ReferralHospital {
  Id id = Isar.autoIncrement;
  String? hospitalName;
  String? regionName;
  String? countyName;
  String? capabilityTier; // e.g. "Level 5 Hospital", "IFRC Refugee Camp Clinic"
  String? contactPhone;
}
