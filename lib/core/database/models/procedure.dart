import 'package:isar/isar.dart';

part 'procedure.g.dart';

@collection
class Procedure {
  Id id = Isar.autoIncrement;

  LocalizedText? title;
  String? iconName;
  int? severityLevel;
  List<FirstAidStep>? steps;
}

@embedded
class FirstAidStep {
  int? stepOrder;
  LocalizedText? instruction;
  String? imageResource;
}

@embedded
class LocalizedText {
  String? en;
  String? sw;
  String? so;

  String get(String lang) {
    if (lang == 'so') return so ?? sw ?? en ?? '';
    if (lang == 'sw') return sw ?? en ?? '';
    return en ?? '';
  }
}
