import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stamp_card/modules/quiz/models/quiz_item.dart';
import 'package:stamp_card/shared/constants/dummy_quiz_items.dart';

class QuizService extends GetxService {
  Future<List<QuizItem>> getQuizItems() async {
    return await Future.delayed(const Duration(seconds: 1), () {
      return DummyQuizItems.quizItems;
    });
  }
}
