import "package:quizz_app/models/subject.dart";
import "package:quizz_app/models/subject_exam.dart";
  
  final List<Subject> subjects = [
    Subject(
      id: "1", 
      subjName: "Math", 
      estimatedTime: "10 min",
      numberOfQuestions: "5",
      exam:SubjectExam(),
      desc: "this exam made for math class students and it's made for testing your ability in math"
    ),
    Subject(
      id: "2", 
      subjName: "English", 
      estimatedTime: "10 min",
      numberOfQuestions: "5",
      exam:SubjectExam(),
      desc: "this exam made for math class students and it's made for testing your ability in English"
    ),
    Subject(
      id: "3", 
      subjName: "Arabic", 
      estimatedTime: "10 min",
      numberOfQuestions: "5",
      exam:SubjectExam(),
      desc: "this exam made for math class students and it's made for testing your ability in Arabic"
    ),
    Subject(
      id: "4", 
      subjName: "Physics", 
      estimatedTime: "10 min",
      numberOfQuestions: "5",
      exam:SubjectExam(),
      desc: "this exam made for math class students and it's made for testing your ability in math Physics"
    ),
    Subject(
      id: "5", 
      subjName: "Chemistry", 
      estimatedTime: "10 min",
      numberOfQuestions: "5",
      exam:SubjectExam(),
      desc: "this exam made for math class students and it's made for testing your ability in math Chemistry"
    ),
  ];