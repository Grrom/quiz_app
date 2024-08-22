import 'package:flutter/material.dart';
import 'package:stamp_card/modules/quiz/models/quiz_item.dart';

class QuizCategory {
  final String name;
  final ImageProvider image;
  final String description;
  final List<QuizItem> questions;

  int get totalQuestionsCount => questions.length;

  QuizCategory({
    required this.name,
    required this.image,
    required this.description,
    required this.questions,
  });

  factory QuizCategory.fromJson(Map<String, dynamic> json) {
    return QuizCategory(
      name: json['name'],
      image: NetworkImage(json['image']),
      description: json['description'],
      questions: List<QuizItem>.from(
        json['questions'].map((x) => QuizItem.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image.toString(),
      'description': description,
      'questions': questions.map((x) => x.toJson()).toList(),
    };
  }
}
