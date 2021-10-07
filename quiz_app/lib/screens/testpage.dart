import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz_bloc.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isfinished = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizStarted) {
          return Scaffold(
            appBar: AppBar(
              title: Text("QUESTION ${state.questionIndex + 1}"),
              centerTitle: true,
            ),
            body: Column(
              children: <Widget>[
                Container(
                  height: height * 0.3,
                  width: width * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: FittedBox(
                    child:
                        Text(state.questions[state.questionIndex].questionText),
                  ),
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
    );
  }
}
