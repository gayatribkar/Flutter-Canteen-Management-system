import 'dart:io';
import 'package:flutter/foundation.dart';

//import './mealDes_defination.dart';

class MealData {
  final String title;
  final String id;
  final File iconImage;
  final int price;
  final String fromTime;
  final String toTime;
  final String description;
  bool isCart;
  // int quantity;
  int counter;
  //final List<MealDescription> desc;
  final String categories;
  bool isSelected;

  MealData({
    this.isCart = false,
    // this.quantity = 1,
    @required this.title,
    @required this.fromTime,
    @required this.toTime,
    @required this.description,
    @required this.id,
    @required this.price,
    @required this.iconImage,
    this.counter = 1,
    //@required this.desc,
    @required this.categories,
    this.isSelected = false,
  });
}
