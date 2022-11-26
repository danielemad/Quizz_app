import 'package:quizz_app/models/question.dart';

class SubjectExam {
  List<Question> questions = [
    Question(
        question: "what is 2 * 2 ?",
        correctAnswerIndex: 3,
        choices: ["15", "30", "6", "4"]),
    Question(
        question: "what is 4 + 7 ?",
        correctAnswerIndex: 0,
        choices: ["11", "26", "17", "4"]),
    Question(
        question: "what is 2 * 4 ?",
        correctAnswerIndex: 0,
        choices: ["8", "7", "3", "1"]),
  ];

  Duration duration = const Duration(minutes: 1);

  int totalCorrectAnswer = 0;
}
