import 'package:isar/isar.dart';
import 'procedure.dart';

part 'quiz_question.g.dart';

@collection
class QuizQuestion {
  Id id = Isar.autoIncrement;

  LocalizedText? question;

  List<String>? optionsEn;
  List<String>? optionsSw;
  List<String>? optionsSo;

  int? correctOptionIndex;

  LocalizedText? explanation;

  List<String> getOptions(String lang) {
    if (lang == 'so') return optionsSo ?? optionsSw ?? optionsEn ?? [];
    if (lang == 'sw') return optionsSw ?? optionsEn ?? [];
    return optionsEn ?? [];
  }
}
