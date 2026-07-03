import 'package:isar/isar.dart';

part 'procedure.g.dart';

@collection
class Procedure {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String titleEn;

  @Index(type: IndexType.value)
  late String titleSw;

  late String iconName;
  late int severityLevel;

  late List<FirstAidStep> steps;
}

@embedded
class FirstAidStep {
  late int stepOrder;
  late String instructionEn;
  late String instructionSw;
  late String imageResource;
}
