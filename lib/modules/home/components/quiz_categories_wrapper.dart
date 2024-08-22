import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stamp_card/modules/home/components/quiz_category_card.dart';
import 'package:stamp_card/modules/home/controllers/quiz_categories_wrapper_controller.dart';
import 'package:stamp_card/shared/components/sized_loading_card.dart';

class QuizCategoriesWrapper extends StatelessWidget {
  const QuizCategoriesWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizCategoriesWrapperController>(
      init: QuizCategoriesWrapperController(),
      builder: (controller) {
        return Obx(() {
          if (controller.isLoading) {
            return const SizedLoadingCard(height: 180, width: double.infinity);
          }
          return Column(
            children: controller.categories.map(
              (category) {
                return QuizCategoryCard(category: category);
              },
            ).toList(),
          );
        });
      },
    );
  }
}
