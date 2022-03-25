import 'package:flutter/material.dart';
import 'package:todo/screens/todo_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskId : Not Just another TodoApp',
      theme: _configureThemeData(),
      home: TodoListScreen(),
    );
  }

  ThemeData _configureThemeData() {
    return ThemeData(
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w800,
              fontSize: 25,
              color: Colors.black,
            ),
            headline2: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 20),
            headline3: TextStyle(
              // fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w700,
              color: Colors.grey,
              fontSize: 15,
            ),
            headline4: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 15),
            headline5: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: 15),
            subtitle1: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
            bodyText1: TextStyle(fontSize: 15, color: Colors.white),
            bodyText2: TextStyle(fontSize: 12, color: Colors.white)));
  }
}
