import "package:flutter/material.dart";
import 'package:quizz_app/home_screen.dart';

class ExamResult extends StatelessWidget {
  int correctAnswers;
  int number_of_questions;
  ExamResult(this.correctAnswers, this.number_of_questions, {super.key});

  List<Widget> checkResults(int answers, int totalQuestions, BuildContext ctx) {
   // Exam.TotalCorrectAnswers = 0;
    if ((answers / totalQuestions * 100) >= 50) {
      return <Widget>[
        Center(
          child: Image.asset(
            "assets/images/happy_face.png",
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          "$answers / $totalQuestions",
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "congratulations! you passed the exam horraay",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pushReplacement(
                  MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("return to the home page"))),
      ];
    } else {
      return <Widget>[
        Center(
          child: Image.asset(
            "assets/images/sad_face.png",
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          "$answers / $totalQuestions",
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "sorry, you failed the exam",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pushReplacement(
                  MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("return to the home page"))),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          children: checkResults(correctAnswers, number_of_questions, context),
        ),
      ),
    );
  }
}
