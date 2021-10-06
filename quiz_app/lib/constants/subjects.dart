import 'dart:ui';

import 'package:flutter/material.dart';

class Subject {
  String subjectName;
  Color color;
  int questionCount;
  Subject(
      {required this.subjectName,
      required this.color,
      required this.questionCount});
}

List<Subject> subjectList = [
  Subject(subjectName: "Physics", color: Colors.red, questionCount: 10),
  Subject(subjectName: "Maths", color: Colors.green, questionCount: 10),
  Subject(subjectName: "Chemistry", color: Colors.blue, questionCount: 10),
  Subject(subjectName: "History", color: Colors.yellow, questionCount: 10),
];
