import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/constants/questions.dart';

class Subject {
  String subjectName;
  Color color;
  int questionCount;
  List<Question> questions;
  Subject(
      {required this.subjectName,
      required this.color,
      required this.questionCount,
      required this.questions});
}

List<Subject> subjectList = [
  Subject(
      subjectName: "Physics",
      color: Colors.red,
      questionCount: 10,
      questions: physics),
  Subject(
      subjectName: "Maths",
      color: Colors.green,
      questionCount: 10,
      questions: maths),
  Subject(
      subjectName: "Chemistry",
      color: Colors.blue,
      questionCount: 10,
      questions: chemistry),
  Subject(
      subjectName: "History",
      color: Colors.yellow,
      questionCount: 10,
      questions: history),
];
