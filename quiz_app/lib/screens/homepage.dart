import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/bloc/quiz_bloc.dart';
import 'package:quiz_app/constants/questions.dart';
import 'package:quiz_app/constants/subjects.dart';
import 'package:quiz_app/constants/themedata.dart';
import 'package:quiz_app/models/result_model.dart';
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
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
                        ? const Icon(Icons.brightness_3, size: 25)
                        : const Icon(Icons.wb_sunny_rounded));
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: TabBar(
                onTap: ((index) {
                  if (index == 1) {
                    a.add(StatsPageEvent());
                  } else if (index == 0) {
                    a.add(HomePageEvent());
                  }
                }),
                labelColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 25),
                unselectedLabelStyle: const TextStyle(fontSize: 15),
                controller: DefaultTabController.of(context),
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: isLightTheme ? Colors.black : Colors.green,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 10),
                    child: Text("HOME"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 10),
                    child: Text("STATS"),
                  )
                ]),
          ),
        ),
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is StatsPageState) {
              return ValueListenableBuilder(
                valueListenable: Hive.box<ResultModel>('results').listenable(),
                builder: (context, Box<ResultModel> box, _) {
                  if (box.values.isEmpty) {
                    return const Text('No Quiz Taken Yet');
                  } else {
                    return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        var result = box.getAt(box.values.length - index - 1);
                        return ListTile(
                          title: Text(result!.subject),
                          subtitle: Text(result.playerName),
                          trailing: Text(result.marks.toString()),
                        );
                      },
                    );
                  }
                },
              );
            } else {
              return Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15.0, 100, 0),
                  child: Text(
                    "Let's Play Quiz",
                    style: TextStyle(
                      fontSize: 40,
                      color: isLightTheme ? Colors.black : Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: subjectList
                        .map((value) => SubjectCard(
                              context: context,
                              subject: value,
                            ))
                        .toList(),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6.0, 0, 6),
                  child: Text(
                    "Recent Results",
                    style: TextStyle(
                        color: isLightTheme ? Colors.black : Colors.white,
                        fontSize: 25),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable:
                      Hive.box<ResultModel>('results').listenable(),
                  builder: (context, Box<ResultModel> box, _) {
                    if (box.values.isEmpty) {
                      return const Text('No Quiz Taken Yet');
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          var result = box.getAt(box.values.length - index - 1);
                          return ListTile(
                            title: Text(result!.subject),
                            subtitle: Text(result.playerName),
                            trailing: Text(result.marks.toString()),
                          );
                        },
                      );
                    }
                  },
                )
              ]);
            }
          },
        ),
      ),
    );
  }
}
