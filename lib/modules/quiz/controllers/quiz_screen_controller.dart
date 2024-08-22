import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_card/modules/quiz/components/results_card.dart';
import 'package:stamp_card/modules/quiz/models/answer_item.dart';

class QuizScreenController extends GetxController {
  final RxMap<String, AnswerItem> _answers = <String, AnswerItem>{}.obs;
  final RxInt _currentQuestionIndex = 0.obs;
  final int totalQuestionsCount;

  QuizScreenController({required this.totalQuestionsCount});

  @override
  void onInit() {
    super.onInit();
    _currentQuestionIndex.listen((value) {
      pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  int get currentQuestionIndex => _currentQuestionIndex.value;

  PageController pageController = PageController();

  List<AnswerItem> get answers => _answers.values.toList();

  bool? checkCorrectAnswerById(String id) {
    return _answers[id]?.isCorrect;
  }

  AnswerItem? getAnswerByQuestionId(String id) {
    return _answers[id];
  }

  void addAnswer(AnswerItem answer) {
    if (_answers.containsKey(answer.id)) {
      return;
    }
    _answers[answer.id] = answer;
    if (_answers.length == totalQuestionsCount) {
      Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ResultsCard(answers: answers),
        ),
      );
      return;
    }
    _currentQuestionIndex.value++;
  }

  void setCurrentQuestionIndex(int value) {
    _currentQuestionIndex.value = value;
  }
}
