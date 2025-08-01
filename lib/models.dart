class Event {
  final String id;
  final String title;
  final String date;
  final String location;
  final String description;
  final List<Stall> stalls;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.stalls,
  });
}

class Stall {
  final String id;
  final String title;
  final String description;
  final String activityType;
  final List<QuizQuestion> quizQuestions;
  final String pollQuestion;
  final List<String> pollOptions;

  Stall({
    required this.id,
    required this.title,
    required this.description,
    required this.activityType,
    this.quizQuestions = const [],
    this.pollQuestion = '',
    this.pollOptions = const [],
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}