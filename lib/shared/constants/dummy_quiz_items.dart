import 'package:stamp_card/modules/quiz/models/quiz_item.dart';

class DummyQuizItems {
  DummyQuizItems._();

  static final List<QuizItem<String>> quizItems = [
    QuizItem(
      question: "Which planet is known as the 'Red Planet'?",
      options: ["Mercury", "Venus", "Mars", "Jupiter"],
      answer: "Mars",
    ),
    QuizItem(
      question:
          "What is the name of the galaxy that contains our Solar System?",
      options: [
        "The Andromeda Galaxy",
        "The Milky Way",
        "The Whilrpool galaxy",
        "The Black Eye Galaxy"
      ],
      answer: "The Milky Way",
    ),
    QuizItem(
      question: "Which planet has the most moons?",
      options: ["Earth", "Jupiter", "Saturn", "Neptune"],
      answer: "Jupiter",
    ),
    QuizItem(
      question: "What is a supernova?",
      options: [
        "A collision of two stars",
        "A black hole eating a star",
        "The explosion of a star",
        "A new star being born"
      ],
      answer: "The explosion of a star",
    ),
    QuizItem(
      question: "Who was teh first woman to travel into space?",
      options: [
        "Sally Ride",
        "Valentina Tereshkova",
        "Mae Jemison",
        "Kalpana Chawla"
      ],
      answer: "Valentina Tereshkova",
    ),
  ];
}
