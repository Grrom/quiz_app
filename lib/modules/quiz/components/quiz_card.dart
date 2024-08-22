import 'package:flutter/material.dart';
import 'package:stamp_card/modules/quiz/components/option_card.dart';
import 'package:stamp_card/modules/quiz/models/answer_item.dart';
import 'package:stamp_card/modules/quiz/models/quiz_item.dart';
import 'package:stamp_card/shared/constants/custom_colors.dart';

class QuizCard extends StatelessWidget {
  final QuizItem item;
  final Function(String) onAnswered;
  final AnswerItem? answer;
  const QuizCard(
    this.item, {
    super.key,
    required this.onAnswered,
    this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: CustomColors.backgroundSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            item.question,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Column(
            children: item.options.map((option) {
              if (answer != null) {
                if (option == answer?.chosenAnswer) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: answer?.isCorrect == true
                          ? CustomColors.expressiveGreen.withOpacity(0.2)
                          : CustomColors.expressiveRed.withOpacity(0.2),
                    ),
                    child: OptionCard(
                      option,
                      value: true,
                      onChosen: (item) {},
                    ),
                  );
                }
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: answer?.answer == option
                        ? CustomColors.expressiveGreen.withOpacity(0.2)
                        : Colors.transparent,
                  ),
                  child: OptionCard(
                    option,
                    value: false,
                    onChosen: (item) {},
                  ),
                );
              }
              return OptionCard(
                option,
                onChosen: (item) {
                  onAnswered(item);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
