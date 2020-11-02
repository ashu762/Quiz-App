import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/Result.dart';
import 'package:quiz_app/card.dart';
import '../Questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
//List<Question> questions = ashutosh[great];

class QuestionModel extends StatefulWidget {
  int index = 0;
  int ashu;
  static int rightquestion = 0;
  static int wrongquestion = 0;
  int chosenset;
  QuestionModel(this.ashu, this.chosenset);
  @override
  _QuestionModelState createState() => _QuestionModelState();
}

class _QuestionModelState extends State<QuestionModel> {
  int currentIndex = 100000;
  int flag = 0;
  double percent = 0;
  @override
  Widget build(BuildContext context) {
    print(widget.ashu);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var widthpixel = width / 100;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Container(
          child: Text(
            '${ashutosh2[widget.ashu]}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow.withOpacity(0.8),
                fontSize: 20),
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 10, bottom: 14),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: LinearPercentIndicator(
              width: widthpixel * 90,
              percent: percent,
              lineHeight: 15,
              animationDuration: 1000,
              progressColor: Colors.pink.withOpacity(0.5),
            ),
          ),
        ),
        Container(
          child: Text(
            '${widget.index + 1} / 10',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Quicksand'),
          ),
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 40, bottom: 10),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                elevation: 8,
                child: Container(
                  //height: height / 6,

                  alignment: Alignment.center,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Question ${widget.index + 1}',
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 22,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${questions[widget.index + (widget.chosenset - 1) * 10].question}',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (i ==
                              questions[widget.index +
                                      (widget.chosenset - 1) * 10]
                                  .correctIndex) {
                            currentIndex = i;
                            percent = (widget.index + 1) / 10;
                            flag = 1;
                            QuestionModel.rightquestion += 1;
                            Alert(
                                style: AlertStyle(
                                    isCloseButton: false,
                                    isOverlayTapDismiss: false),
                                context: context,
                                type: AlertType.success,
                                title: 'Correct Answer',
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(height: 10),
                                    Text(
                                      'You are Right!!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                                buttons: [
                                  DialogButton(
                                    color: Colors.green[400],
                                    child: Text(
                                      'Next Question',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).pop();
                                        if (widget.index >= 9) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Result(
                                                      QuestionModel
                                                          .rightquestion,
                                                      QuestionModel
                                                          .wrongquestion,
                                                      widget.chosenset)));
                                        } else {
                                          widget.index += 1;
                                          currentIndex = 1000000;
                                          flag = 0;
                                        }
                                      });
                                    },
                                  )
                                ]).show();
                          } else {
                            percent = (widget.index + 1) / 10;
                            flag = 0;
                            currentIndex = i;
                            QuestionModel.wrongquestion += 1;
                            Alert(
                                style: AlertStyle(
                                    isCloseButton: false,
                                    isOverlayTapDismiss: false),
                                context: context,
                                type: AlertType.error,
                                title: 'Wrong Answer',
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(height: 10),
                                    Text(
                                      'The Correct answer is ${questions[widget.index + (widget.chosenset - 1) * 10].answers[questions[widget.index + (widget.chosenset - 1) * 10].correctIndex]}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                                buttons: [
                                  DialogButton(
                                    color: Colors.pink[400],
                                    child: Text('Next Question',
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).pop();
                                        if (widget.index >= 9) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Result(
                                                      QuestionModel
                                                          .rightquestion,
                                                      QuestionModel
                                                          .wrongquestion,
                                                      widget.chosenset)));
                                        } else {
                                          widget.index += 1;
                                          currentIndex = 1000000;
                                          flag = 0;
                                        }
                                      });
                                    },
                                  )
                                ]).show();
                          }
                        });
                      },
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                        // elevation: 5,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.purple, width: 1),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          // alignment: Alignment.topCenter,
                          // color: Color.fromRGBO(204, 255, 204, 1),
                          // decoration: BoxDecoration(
                          //   // border: Border.all(
                          //   //     color: Color.fromRGBO(100, 76, 216, 0.7),
                          //   //     width: 2),
                          //   // borderRadius: BorderRadius.circular(15),
                          //   color: currentIndex == i && flag == 1
                          //       ? Color.fromRGBO(74, 240, 60, 0.7)
                          //       : currentIndex == i
                          //           ? Color.fromRGBO(230, 20, 30, 0.7)
                          //           : Colors.white,
                          //   border: Border.all(width: 2, color: Colors.grey),
                          // ),
                          child: Text(
                            questions[
                                    widget.index + (widget.chosenset - 1) * 10]
                                .answers[i],
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 4,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              //     Row(
              //       children: <Widget>[
              //         IconButton(
              //           icon: Icon(Icons.skip_previous),
              //           iconSize: 40,
              //           onPressed: () {
              //             setState(() {
              //               if (widget.index <= 0) {
              //               } else {
              //                 widget.index -= 1;
              //                 currentIndex = 100000;
              //                 flag = 0;
              //               }
              //             });
              //           },
              //         ),
              //       ],
              //     ),
              //     IconButton(
              //       icon: Icon(Icons.skip_next),
              //       iconSize: 40,
              //       onPressed: () {
              //         setState(() {
              //           if (widget.index >= questions.length - 1) {
              //             Navigator.of(context).pushNamed(Result.routeName);
              //           } else {
              //             widget.index += 1;
              //             currentIndex = 1000000;
              //             flag = 0;
              //           }
              //         });
              //       },
              //     ),
              //     SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              //   ],
              // )
            ],
          ),
        ),
      ],
    );
  }
}
