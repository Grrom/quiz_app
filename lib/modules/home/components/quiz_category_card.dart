import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_card/modules/home/models/quiz_category.dart';
import 'package:stamp_card/modules/quiz/components/quiz_screen.dart';
import 'package:stamp_card/shared/constants/custom_colors.dart';

class QuizCategoryCard extends StatelessWidget {
  final QuizCategory category;
  const QuizCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => QuizScreen(category: category));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: category.image,
          ),
          color: CustomColors.backgroundSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            const SizedBox(height: 120),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.backgroundFill.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  "${category.totalQuestionsCount} items",
                  style: const TextStyle(color: CustomColors.backgroundSurface),
                ),
                subtitle: Text(
                  category.description,
                  style: const TextStyle(color: CustomColors.backgroundSurface),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
