import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz_bloc.dart';
import 'package:quiz_app/constants/subjects.dart';
import 'package:quiz_app/constants/themedata.dart';
import 'package:quiz_app/screens/testscreen.dart';
import 'package:quiz_app/widget/subject_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    QuizBloc a = BlocProvider.of<QuizBloc>(context);
    bool isLightTheme =
        ThemeProvider.of(context)!.brightness == Brightness.light;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
                        ? Icon(Icons.brightness_3, size: 25)
                        : Icon(Icons.wb_sunny_rounded));
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: TabBar(
                onTap: ((index) {}),
                labelColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 25),
                unselectedLabelStyle: const TextStyle(fontSize: 15),
                controller: DefaultTabController.of(context),
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: isLightTheme ? Colors.black : Colors.green,
                tabs: const [Text("HOME"), Text("STATS")]),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: subjectList
                  .map((value) => SubjectCard(context: context, subject: value))
                  .toList(),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TestPage(title: 'Quiz App')));
          },
          tooltip: 'Start Quiz',
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
