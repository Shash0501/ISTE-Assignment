part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class StartQuiz extends QuizEvent implements Equatable {
  final List<Question> questions;
  final String playerName;
  StartQuiz({required this.questions, required this.playerName});
  @override
  List<Object> get props => [questions, playerName];
}

class QuizContinue extends QuizEvent implements Equatable {
  final List<Question> questions;
  final int questionIndex;
  final int marks;
  final String playerName;

  QuizContinue({
    required this.questions,
    required this.questionIndex,
    required this.marks,
    required this.playerName,
  });
  @override
  List<Object> get props => [questions, questionIndex, marks, playerName];
}

class QuizFinished extends QuizEvent {
  final int marks;
  final String playerName;
  List<Question> questions;
  QuizFinished(
      {required this.marks, required this.playerName, required this.questions});
}

class StatsPageEvent extends QuizEvent {}

class HomePageEvent extends QuizEvent {}
