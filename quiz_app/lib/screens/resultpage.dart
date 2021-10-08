import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz_bloc.dart';
import 'package:quiz_app/constants/themedata.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    bool isLightTheme =
        ThemeProvider.of(context)!.brightness == Brightness.light;
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizFinishedState) {
          return Scaffold(
            appBar: AppBar(
              title: Text("RESULT"),
              actions: [
                ThemeSwitcher(
                  builder: (context) {
                    return IconButton(
                        onPressed: () {
                          ThemeSwitcher.of(context)!.changeTheme(
                            theme: ThemeProvider.of(context)!.brightness ==
                                    Brightness.light
                                ? darkThemeData
                                : lightThemeData,
                          );
                        },
                        icon: isLightTheme
                            ? const Icon(Icons.brightness_3, size: 25)
                            : const Icon(Icons.wb_sunny_rounded));
                  },
                ),
              ],
            ),
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.playerName.toUpperCase(),
                        style: const TextStyle(fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.SubjectName,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      radius: MediaQuery.of(context).size.width / 2,
                      lineWidth: 20,
                      percent: state.marks / 10,
                      center: Text(state.marks.toString(),
                          style: const TextStyle(fontSize: 20)),
                      progressColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
