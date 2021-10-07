part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizStarted extends QuizState {
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
}
