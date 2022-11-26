import 'package:quizz_app/models/subject_exam.dart';

class Subject {
  String id, subjName, estimatedTime, numberOfQuestions, desc;
  SubjectExam exam;
  
  Subject({
    required this.id,
    required this.subjName,
    required this.estimatedTime,
    required this.numberOfQuestions,
    required this.desc,
    required this.exam
  });
}
