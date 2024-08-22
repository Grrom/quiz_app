class QuizItem<T> {
  final String question;
  final List<T> options;
  final T answer;

  QuizItem({
    required this.question,
    required this.options,
    required this.answer,
  }) : assert(options.contains(answer));

  factory QuizItem.fromJson(Map<String, dynamic> json) {
    return QuizItem(
      question: json['question'],
      options: List<T>.from(json['options']),
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'answer': answer,
    };
  }
}
