import 'package:isar/isar.dart';

part 'quiz_question.g.dart';

@collection
class QuizQuestion {
  Id id = Isar.autoIncrement;

  late String questionEn;
  late String questionSw;

  late List<String> optionsEn;
  late List<String> optionsSw;

  late int correctOptionIndex;

  late String explanationEn;
  late String explanationSw;
}
