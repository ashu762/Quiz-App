import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/starting_page.dart';
import 'package:pie_chart/pie_chart.dart';
import '../card.dart';
import '../Widgets/question_model.dart';

class Result extends StatelessWidget {
  static const routeName = "./result";
  int correct;
  int wrong;
  int chosenset;
  Result(this.correct, this.wrong, this.chosenset);
  @override
  Widget build(BuildContext context) {
    double percent = (correct / (correct + wrong));
    String res;
    if (percent > 0.8) {
      res = 'Amazing Performance.';
    } else if (percent > 0.5) {
      res = 'Good Performance.Need Some Improvment';
    } else {
      res = 'You Need to Practice More!!';
    }
    QuestionModel.rightquestion = 0;
    QuestionModel.wrongquestion = 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 100),
          PieChart(
            dataMap: {"wrong": wrong.toDouble(), "correct": correct.toDouble()},
            chartType: ChartType.ring,
            chartRadius: MediaQuery.of(context).size.width / 2.7,
            animationDuration: Duration(seconds: 1),
          ),
          SizedBox(height: 50),
          Text(
            'You scored ${correct}/${wrong + correct}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          Text(res, style: TextStyle(fontSize: 24)),
          SizedBox(height: 50),
          Center(
              child: RaisedButton(
            child: Text('restart'),
            onPressed: () {
              // questions.shuffle();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => StartingPage(great, chosenset),
                ),
              );
            },
          )),
          SizedBox(height: 50),
          Center(
              child: RaisedButton(
            child: Text('Next'),
            onPressed: () {
              // questions.shuffle();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => StartingPage(great, chosenset + 1),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
