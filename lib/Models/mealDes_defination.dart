import 'package:flutter/foundation.dart';

class MealDescription{
  String description;
  final String title;
  final int price;
  final String time;
  bool isClicked;

  MealDescription(
    {
      @required this.description,
      @required this.title,
      @required this.price,
      @required this.time,
      this.isClicked = false,
    }
  );

}
