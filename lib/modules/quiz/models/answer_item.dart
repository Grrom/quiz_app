import 'package:stamp_card/modules/quiz/models/quiz_item.dart';

class AnswerItem extends QuizItem {
  final String chosenAnswer;

  bool get isCorrect => chosenAnswer == answer;

  AnswerItem(
    this.chosenAnswer, {
    required super.id,
    required super.question,
    required super.options,
    required super.answer,
  });

  factory AnswerItem.fromQuizItem(QuizItem item, String chosenAnswer) {
    return AnswerItem(
      chosenAnswer,
      id: item.id,
      question: item.question,
      options: item.options,
      answer: item.answer,
    );
  }
}
