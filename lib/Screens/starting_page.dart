import 'package:flutter/material.dart';
import 'package:quiz_app/Questions.dart';
import 'package:quiz_app/Screens/categories.dart';
import 'package:quiz_app/Widgets/question_model.dart';

class StartingPage extends StatefulWidget {
  static const routeName = "./starting-page";
  int incoming;
  int chosenset;
  StartingPage(this.incoming, this.chosenset);
  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  int i = 0;
  // Color gradientStart = Color.fromRGBO(100, 200, 245, 0.25);
  // Color gradientEnd = Colors.purple.withOpacity(0.1);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Color.fromRGBO(210, 210, 210, 0.9),
      backgroundColor: Colors.white.withOpacity(0.87),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.red,
        ),
        title: Text(
          'QUIZ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(21, 68, 111, 0.7),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: height / 3.6,
              color: Color.fromRGBO(21, 68, 111, 0.9),
            ),
            QuestionModel(widget.incoming, widget.chosenset),
          ],
        ),
        // decoration: BoxDecoration(
        //   gradient: new LinearGradient(
        //       colors: [gradientStart, gradientEnd],
        //       begin: const FractionalOffset(0.5, 0.0),
        //       end: const FractionalOffset(0.0, 0.5),
        //       stops: [0.0, 1.0],
        //       tileMode: TileMode.clamp),
        // ),
      ),
    );
  }
}
