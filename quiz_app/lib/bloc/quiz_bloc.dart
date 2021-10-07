import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/constants/questions.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<QuizEvent>((event, emit) {
      if (event is StartQuiz) {
        emit(QuizStarted(
            questions: event.questions,
            questionIndex: 0,
            marks: 0,
            playerName: event.playerName));
      }
    });
  }
}
