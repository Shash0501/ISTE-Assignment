import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants/subjects.dart';

class SubjectCard extends StatelessWidget {
  Subject subject;
  BuildContext context;
  SubjectCard({required this.subject, required this.context});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final namecontroller = TextEditingController();
  void showAlertDialog(BuildContext context, bool isLightTheme) {
    String name;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: isLightTheme ? Colors.black : Colors.white),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: 'Name',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          color: isLightTheme ? Colors.black : Colors.white,
                          onPressed: () {
                            namecontroller.clear();
                          },
                        ),
                        focusColor: isLightTheme ? Colors.black : Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  isLightTheme ? Colors.black : Colors.white),
                        )),
                    maxLength: 20,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is required';
                      }
                    },
                    onSaved: (value) {
                      name = value.toString();
                    },
                    style: TextStyle(
                        color: isLightTheme ? Colors.black : Colors.white),
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      print(_formKey.currentState);
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        namecontroller.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Ok')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('No')),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme =
        ThemeProvider.of(context)!.brightness == Brightness.light;
    return InkWell(
      onTap: () {
        showAlertDialog(context, isLightTheme);
      },
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: subject.color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(subject.subjectName),
        ),
      ),
    );
  }
}
