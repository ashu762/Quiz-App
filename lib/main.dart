import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/Screens/Result.dart';
import 'package:quiz_app/Screens/categories.dart';
import 'package:quiz_app/Screens/landing.dart';
import 'package:quiz_app/Screens/starting.dart';

import 'Screens/starting_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Raleway',
        ),
        initialRoute: Landing.routeName,
        routes: {
          Result.routeName: (ctx) => Result(3, 4, 1),
          StartingPage.routeName: (ctx) => StartingPage(0, 1000),
          Categories.routeName: (ctx) => Categories(),
          Starting.routeName: (ctx) => Starting(2),
          Landing.routeName: (ctx) => Landing(),
        });
  }
}
