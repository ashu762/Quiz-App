import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/categories.dart';

class Landing extends StatelessWidget {
  static const routeName = './landing';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 50),
        Image(
          image: AssetImage('./assets/images/quiz.webp'),
          height: height / 3.5,
        ),
        SizedBox(height: 60),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Categories.routeName);
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                'Endless Mode',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    ));
  }
}
