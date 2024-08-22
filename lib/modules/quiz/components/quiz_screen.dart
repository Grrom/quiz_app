import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_card/modules/home/models/quiz_category.dart';
import 'package:stamp_card/modules/quiz/components/quiz_card.dart';
import 'package:stamp_card/modules/quiz/controllers/quiz_screen_controller.dart';
import 'package:stamp_card/modules/quiz/models/answer_item.dart';
import 'package:stamp_card/shared/constants/custom_colors.dart';

class QuizScreen extends StatelessWidget {
  final QuizCategory category;
  const QuizScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizScreenController>(
      init: QuizScreenController(
        totalQuestionsCount: category.totalQuestionsCount,
      ),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(category.name),
          ),
          body: Obx(
            () => Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children:
                        List.generate(category.totalQuestionsCount, (index) {
                      return Column(
                        children: [
                          () {
                            if (controller.checkCorrectAnswerById(
                                  category.questions[index].id,
                                ) ==
                                true) {
                              return const Icon(
                                Icons.check,
                                size: 36,
                                color: CustomColors.expressiveGreen,
                              );
                            }
                            if (controller.checkCorrectAnswerById(
                                  category.questions[index].id,
                                ) ==
                                false) {
                              return const Icon(
                                Icons.close,
                                size: 36,
                                color: CustomColors.expressiveRed,
                              );
                            }
                            if (index >= controller.currentQuestionIndex) {
                              return const Icon(
                                Icons.circle_outlined,
                                size: 36,
                                color: CustomColors.backgroundDisabled,
                              );
                            }
                            return const SizedBox();
                          }(),
                          if (index == controller.currentQuestionIndex)
                            const Icon(
                              Icons.circle,
                              size: 8,
                              color: CustomColors.mainBlue,
                            ),
                        ],
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: PageView(
                    onPageChanged: (value) {
                      controller.setCurrentQuestionIndex(value);
                    },
                    controller: controller.pageController,
                    children: [
                      ...category.questions.map((item) {
                        return QuizCard(
                          item,
                          answer: controller.getAnswerByQuestionId(item.id),
                          onAnswered: (answer) {
                            controller.addAnswer(
                              AnswerItem.fromQuizItem(item, answer),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
