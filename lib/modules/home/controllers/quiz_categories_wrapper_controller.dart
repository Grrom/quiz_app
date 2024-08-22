import 'package:get/get.dart';
import 'package:stamp_card/modules/home/models/quiz_category.dart';
import 'package:stamp_card/modules/quiz/services/quiz_service.dart';

class QuizCategoriesWrapperController extends GetxController {
  final _quizService = Get.put<QuizService>(QuizService());

  final RxBool _isLoading = false.obs;
  final RxList<QuizCategory> _categories = <QuizCategory>[].obs;

  bool get isLoading => _isLoading.value;
  List<QuizCategory> get categories => _categories;

  @override
  void onInit() {
    super.onInit();
    _getQuizCategories();
  }

  _getQuizCategories() async {
    try {
      _isLoading.value = true;
      _categories.value = await _quizService.getQuizCategories();
    } finally {
      _isLoading.value = false;
    }
  }
}
