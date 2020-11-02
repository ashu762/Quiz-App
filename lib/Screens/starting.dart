import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/starting_page.dart';
import 'package:quiz_app/card.dart';
import 'package:quiz_app/catnames.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Starting extends StatefulWidget {
  static const routeName = './starting';
  int index;

  Starting(this.index);

  @override
  _StartingState createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  int p = (questions.length / 10).floor();
  int chosenIndex = 10000;
  @override
  Widget build(BuildContext context) {
    print(p);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          categorynames[widget.index].name,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.red,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              // Opacity(
              //   opacity: 0.9,
              //   child: Image(
              //     color: Colors.teal[300],
              //     image: AssetImage('./assets/images/1.jpg'),
              //     height: MediaQuery.of(context).size.height / 2.5,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Opacity(
                opacity: 0.7,
                child: Image(
                  image: AssetImage(categorynames[widget.index].img),
                  height: MediaQuery.of(context).size.height / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
            ]),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(40),
              child: Center(
                child: Text(categorynames[widget.index].description,
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
                child: Text('Choose the Set',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40),
                itemCount: p,
                itemBuilder: (context, ind) => GestureDetector(
                  onTap: () {
                    setState(() {
                      chosenIndex = ind;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: chosenIndex == ind ? Colors.pink : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.pink, width: 1)),
                    child: Text('${ind + 1}',
                        style: TextStyle(
                            color: chosenIndex == ind
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                if (chosenIndex == 10000) {
                  Alert(
                      style: AlertStyle(
                          isCloseButton: false, isOverlayTapDismiss: false),
                      context: context,
                      type: AlertType.warning,
                      title: 'Choose one set',
                      buttons: [
                        DialogButton(
                          color: Colors.red[400],
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ]).show();
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StartingPage(widget.index, chosenIndex + 1)));
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text('Start the Quiz!',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
