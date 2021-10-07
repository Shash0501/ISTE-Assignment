import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:quiz_app/constants/themedata.dart';
import 'package:quiz_app/screens/homepage.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'bloc/quiz_bloc.dart';
import 'models/result_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ResultModelAdapter());
  await Hive.openBox<ResultModel>('results');
  var box = Hive.box<ResultModel>('results');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isPlatformDark =
        WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? darkThemeData : lightThemeData;
    return BlocProvider(
      create: (context) => QuizBloc(),
      child: ThemeProvider(
        initTheme: initTheme,
        builder: (_, myTheme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: myTheme,
            home: const MyHomePage(
              title: 'abc',
            ),
          );
        },
      ),
    );
  }
}
