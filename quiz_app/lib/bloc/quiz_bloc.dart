import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/constants/questions.dart';
import 'package:quiz_app/models/result_model.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<QuizEvent>((event, emit) {
      var box = Hive.box<ResultModel>('results');

      if (event is StartQuiz) {
        emit(QuizStarted(
            questions: event.questions,
            questionIndex: 0,
            marks: 0,
            playerName: event.playerName));
      } else if (event is QuizContinue) {
        print(event.questionIndex);
        emit(QuizStarted(
            questions: event.questions,
            questionIndex: event.questionIndex,
            marks: event.marks,
            playerName: event.playerName));
      } else if (event is QuizFinished) {
        String? subjectName = subjectname[event.questions];
        ResultModel result = ResultModel(
            subject: subjectName ?? "PHYSICS",
            correctanswers: event.marks,
            marks: event.marks,
            playerName: event.playerName);

        box.add(result);
        emit(QuizFinishedState(
            marks: event.marks,
            SubjectName: subjectName ?? "Physics",
            correctanswers: event.marks,
            playerName: event.playerName));
      } else if (event is StatsPageEvent) {
        emit(StatsPageState());
      } else if (event is HomePageEvent) {
        emit(HomePageState());
      }
    });
  }
}
