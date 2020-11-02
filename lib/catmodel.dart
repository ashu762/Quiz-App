import 'package:flutter/material.dart';

class Category {
  const Category(
      {@required this.name,
      @required this.color,
      @required this.description,
      this.img});

  final Color color;
  final String name;
  final String description;
  final String img;
}
