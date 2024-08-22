import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_card/modules/quiz/models/answer_item.dart';
import 'package:stamp_card/shared/constants/custom_colors.dart';

class ResultsCard extends StatelessWidget {
  final List<AnswerItem> answers;
  const ResultsCard({
    super.key,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.backgroundSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Results",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "You got ${answers.where((element) => element.isCorrect).length} out of ${answers.length} correct",
            style: const TextStyle(
              fontSize: 20,
              color: CustomColors.textSecondary,
            ),
          ),
          Text(
            () {
              if (answers.where((element) => element.isCorrect).length ==
                  answers.length) {
                return "Congratulations!";
              }
              if (answers.where((element) => element.isCorrect).length >=
                  answers.length / 2) {
                return "Good job!";
              }
              return "Don't worry, we won't tell anyone!";
            }(),
            style: const TextStyle(height: 4.0),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Get.until((route) => route.isFirst);
              },
              child: const Text("Back to Home"),
            ),
          )
        ],
      ),
    );
  }
}
