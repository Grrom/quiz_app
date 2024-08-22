class QuizItem {
  final String id;
  final String question;
  final List<String> options;
  final String answer;

  QuizItem({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
  }) : assert(options.contains(answer));

  factory QuizItem.fromJson(Map<String, dynamic> json) {
    return QuizItem(
      id: json['id'].toString(),
      question: json['question'],
      options: List<String>.from(json['options']),
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'answer': answer,
    };
  }
}
