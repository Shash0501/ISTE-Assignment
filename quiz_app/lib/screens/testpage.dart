import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz_bloc.dart';
import 'package:quiz_app/constants/questions.dart';
import 'package:quiz_app/screens/resultpage.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool finished = false;
  bool hasAnswered = false;
  bool iscorrect = false;
  void checkAnswer(int index, int correctindex) {
    bool a = false;
    if (index == correctindex) {
      a = true;
    } else {
      print("wrong answer");
    }
    setState(() {
      hasAnswered = true;
      iscorrect = a;
    });

    ScaffoldMessenger.of(context).showSnackBar(snackBar(iscorrect));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Future<bool> ExitQuiz() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to stop the Quiz'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizStarted) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("QUESTION ${state.questionIndex + 1}"),
                centerTitle: true,
              ),
              body: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Container(
                      height: height *
                          0.10 *
                          (state.questions[state.questionIndex].questionText
                                      .length /
                                  43.0)
                              .ceil(),
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.questions[state.questionIndex].questionText,
                          style: const TextStyle(fontSize: 30),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () => !hasAnswered
                        ? checkAnswer(1,
                            state.questions[state.questionIndex].correctAnswer)
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.transparent,
                          border: Border.all(
                            color: hasAnswered
                                ? ((state.questions[state.questionIndex]
                                            .correctAnswer) ==
                                        1
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.questions[state.questionIndex].option1,
                            style: const TextStyle(fontSize: 30),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => !hasAnswered
                        ? checkAnswer(2,
                            state.questions[state.questionIndex].correctAnswer)
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.transparent,
                          border: Border.all(
                            color: hasAnswered
                                ? ((state.questions[state.questionIndex]
                                            .correctAnswer) ==
                                        2
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.questions[state.questionIndex].option2,
                            style: const TextStyle(fontSize: 30),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => !hasAnswered
                        ? checkAnswer(3,
                            state.questions[state.questionIndex].correctAnswer)
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.transparent,
                          border: Border.all(
                            color: hasAnswered
                                ? ((state.questions[state.questionIndex]
                                            .correctAnswer) ==
                                        3
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.questions[state.questionIndex].option3,
                            style: const TextStyle(fontSize: 30),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => !hasAnswered
                        ? checkAnswer(4,
                            state.questions[state.questionIndex].correctAnswer)
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.transparent,
                          border: Border.all(
                            color: hasAnswered
                                ? ((state.questions[state.questionIndex]
                                            .correctAnswer) ==
                                        4
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.questions[state.questionIndex].option4,
                            style: const TextStyle(fontSize: 30),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.marks.toString()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () async {
                              bool wantToExit = await ExitQuiz();
                              if (wantToExit) {
                                BlocProvider.of<QuizBloc>(context).add(
                                    QuizFinished(
                                        marks: iscorrect
                                            ? state.marks + 1
                                            : state.marks,
                                        questions: state.questions,
                                        playerName: state.playerName));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider.value(
                                                value:
                                                    BlocProvider.of<QuizBloc>(
                                                        context),
                                                child: ResultPage())));
                              }
                            },
                            child: Text("End")),
                      ),
                      hasAnswered
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (state.questionIndex ==
                                      state.questions.length - 1) {
                                    BlocProvider.of<QuizBloc>(context).add(
                                        QuizFinished(
                                            marks: iscorrect
                                                ? state.marks + 1
                                                : state.marks,
                                            questions: state.questions,
                                            playerName: state.playerName));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider.value(
                                                    value: BlocProvider.of<
                                                        QuizBloc>(context),
                                                    child: ResultPage())));
                                  } else {
                                    CallBloc(
                                        context,
                                        state.questions,
                                        state.questionIndex + 1,
                                        state.marks,
                                        state.playerName,
                                        iscorrect);
                                  }

                                  setState(() {
                                    finished = false;
                                    hasAnswered = false;
                                    iscorrect = false;
                                  });
                                },
                                child: const Text('Next'),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is QuizContinue) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

SnackBar snackBar(bool iscorrect) {
  return SnackBar(
    backgroundColor: iscorrect ? Colors.green : Colors.red,
    elevation: 2.0,
    content: Text(
      iscorrect ? 'Correct Answer' : 'Wrong Answer',
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    duration: const Duration(milliseconds: 750),
  );
}

void CallBloc(BuildContext context, List<Question> questions, int questionIndex,
    int marks, String playerName, bool iscorrect) {
  BlocProvider.of<QuizBloc>(context).add(QuizContinue(
      questions: questions,
      questionIndex: questionIndex,
      marks: iscorrect ? marks + 1 : marks,
      playerName: playerName));
}
