import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/question_model.dart';
import 'package:quiz_app/catnames.dart';

import '../card.dart';

class Categories extends StatefulWidget {
  static const routeName = './categories';
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    QuestionModel.rightquestion = 0;
    QuestionModel.wrongquestion = 0;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.red,
          ),
          // title: Text(
          //   'CATEGORIES',
          //   style: TextStyle(color: Colors.black),
          // ),
          // centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 34),
            ),
            SizedBox(height: 50),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
              ),
              padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
              itemCount: categorynames.length,
              itemBuilder: (context, index) =>
                  PokeCategoryCard(categorynames[index], index),
            ),
          ],
        ));
  }
}
