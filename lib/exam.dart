import 'package:flutter/material.dart';
import 'package:quizz_app/exam_result.dart';
import 'package:quizz_app/models/question.dart';
import 'package:quizz_app/models/subject_exam.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:quizz_app/new_btn.dart';

class Exam extends StatefulWidget {
  SubjectExam exam;
  Exam(this.exam, {super.key});

  static CountDownController counterController = CountDownController();
  @override
  ExamState createState() => ExamState();
}

class ExamState extends State<Exam> {
  int currentQuestionIndex = 0;
  late List<Question> examQuestions;
  late int questionsListLength;
  late int correctAnswerIndex;
  late int duration;

  int groupVal = -1;
  bool isAnswered = false;

  @override
  void initState() {
    super.initState();
    widget.exam.totalCorrectAnswer = 0;
    examQuestions = widget.exam.questions;
    questionsListLength = examQuestions.length;
    duration = widget.exam.duration.inSeconds;
  }

  void changeQuestionIndex() {
    if (currentQuestionIndex < questionsListLength - 1) {
      Exam.counterController.restart();
      setState(() {
        currentQuestionIndex++;
        isAnswered = false;
        groupVal = -1;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) =>
              ExamResult(widget.exam.totalCorrectAnswer, questionsListLength)));
    }
  }

  void increasePoint() {
    widget.exam.totalCorrectAnswer++;
  }

  void changeGroupVal(int newVal) {
    setState(() {
      groupVal = newVal;
      isAnswered = true;
    });
  }

/*
  Color tileColor = Colors.red;
  int? _value = -1;
  List<Widget> buildRadioTile(List<String> choices) {
    List<Widget> choicesWidget = [];
    for (int i = 0; i < choices.length; i++) {
      choicesWidget.addAll(
        [
          const SizedBox(height: 20),
          RadioListTile(
            contentPadding: const EdgeInsets.all(8),
            value: i,
            groupValue: _value,
            title: Text(choices[i]),
            onChanged: (newValue) {
              setState(() {
                if(newValue == correctAnswerIndex)
                {
                  _value = newValue;
                }
              });
            },
          ),
        ]
      );
    }

    return choicesWidget;
  }
*/

  @override
  Widget build(BuildContext context) {
    correctAnswerIndex = examQuestions[currentQuestionIndex].correctAnswerIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text("Question ${currentQuestionIndex + 1}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: CircularCountDownTimer(
                isReverse: true,
                textFormat: CountdownTextFormat.MM_SS,
                duration: duration,
                initialDuration: 0,
                width: 70,
                height: 70,
                controller: Exam.counterController,
                onComplete: changeQuestionIndex,
                ringColor: const Color.fromARGB(255, 232, 232, 232),
                fillColor: Colors.blue,
              ),
            ),
            Text(
              examQuestions[currentQuestionIndex].question,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  children: examQuestions[currentQuestionIndex]
                      .choices
                      .map((choice) => ChoiceRadioBtn(
                          examQuestions[currentQuestionIndex]
                              .choices
                              .indexOf(choice),
                          choice,
                          correctAnswerIndex,
                          groupVal,
                          isAnswered,
                          changeGroupVal,
                          changeQuestionIndex,
                          increasePoint))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
