import "package:flutter/material.dart";
import 'package:quizz_app/exam.dart';

class ChoiceRadioBtn extends StatefulWidget {

  int radioBtnVal , radioBtnGroupVal, correctAnswerIndex;
  String choice;
  bool isAnswered;
  Function changeQuestion , setGroupValue , setTotalCorrectAnswers;

  ChoiceRadioBtn(
    this.radioBtnVal,
    this.choice, 
    this.correctAnswerIndex, 
    this.radioBtnGroupVal,
    this.isAnswered,
    this.setGroupValue,
    this.changeQuestion,
    this.setTotalCorrectAnswers,
    {super.key}
  );

  @override
  ChoiceRadioBtnState createState() => ChoiceRadioBtnState();
}

class ChoiceRadioBtnState extends State<ChoiceRadioBtn> {

  @override
  void initState() {
    super.initState();
  }

  Color choiceBorderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical:10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: choiceBorderColor
        )
      ),
      child: RadioListTile(
        contentPadding: const EdgeInsets.all(8),
        value:widget.radioBtnVal,
        groupValue: widget.radioBtnGroupVal,
        title: Text(widget.choice),
        onChanged: widget.isAnswered ? null : (newValue) {
          widget.setGroupValue(newValue!);
          setState(() {
            if(newValue == widget.correctAnswerIndex)
            {
              choiceBorderColor = Colors.green;
              widget.setTotalCorrectAnswers();
            }
            else{
              choiceBorderColor = Colors.red;                    
            }
            Exam.counterController.pause(); 
            Future.delayed(const Duration(milliseconds:1500) , (){
              choiceBorderColor = Colors.transparent;     
              widget.changeQuestion();
            });
          });
        },
      ),
    );
  }
}
