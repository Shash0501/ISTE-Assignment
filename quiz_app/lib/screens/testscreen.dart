import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants/themedata.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: Icon(Icons.brightness_3, size: 25),
              );
            },
          ),
        ],
      ),
    );
  }
}
