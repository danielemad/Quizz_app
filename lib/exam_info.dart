import "package:flutter/material.dart";
import 'package:quizz_app/exam.dart';
import 'package:quizz_app/models/subject.dart';
import 'package:quizz_app/my_drawer.dart';

class ExamInfo extends StatelessWidget {


  void goTo(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => Exam(subject.exam)));
  }

  final Subject subject;

  const ExamInfo(this.subject, {super.key});

  Widget displayExamInfo(String str) {
    return Text(
      str,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
              splashRadius: 24,
            ),
            Builder(
              builder: (ctx) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                  splashRadius: 24,
                );
              }
            ),
          ],
        ),
        title:Text(subject.subjName),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Information about the exam",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40),
              displayExamInfo(subject.desc),
              const SizedBox(height: 40),
              displayExamInfo(
                  "the estimated time for this exam is : ${subject.estimatedTime}"),
              const SizedBox(height: 20),
              displayExamInfo(
                "the number of questions of this exam is : ${subject.numberOfQuestions}",
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    ),
                  ),
                  onPressed: () {
                    goTo(context);
                  },
                  child: const Text("start exam"),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
