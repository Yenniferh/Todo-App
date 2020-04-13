import 'package:f_202010_todo_class/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xFF00BCD4),
          accentColor: Color(0xFFFF4081),
          primaryTextTheme: TextTheme(
              title: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              headline: TextStyle(
                  fontFamily: 'Lato',
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
              subhead: TextStyle(
                  fontFamily: 'Lato',
                  color: Color(0xFF212121),
                  fontSize: 15.0))),
      home: HomePageTodo(),
    );
  }
}
