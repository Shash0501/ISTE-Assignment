part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizStarted extends QuizState implements Equatable {
  final List<Question> questions;
  final int questionIndex;
  final int marks;
  final String playerName;

  QuizStarted({
    required this.questions,
    required this.questionIndex,
    required this.marks,
    required this.playerName,
  });
  @override
  List<Object> get props => [questions, questionIndex, marks, playerName];
}

class QuizFinishedState extends QuizState {
  final int marks;
  final String playerName;
  final String SubjectName;
  final int correctanswers;

  QuizFinishedState({
    required this.marks,
    required this.playerName,
    required this.SubjectName,
    required this.correctanswers,
  });
}

class HomePageState extends QuizState {}

class StatsPageState extends QuizState {}
