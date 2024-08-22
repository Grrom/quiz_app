import 'package:flutter/material.dart';
import 'package:stamp_card/modules/home/components/quiz_categories_wrapper.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose a category"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: QuizCategoriesWrapper(),
        ),
      ),
    );
  }
}
