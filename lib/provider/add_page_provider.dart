import 'dart:io';
import 'package:flutter/material.dart';
import "../Models/add_page_defination.dart";

class AddData with ChangeNotifier {
  List<AddPage> _items = [];

  List<AddPage> get item {
    return [..._items];
  }

  void add(
    String savedtitle,
    File savedImage,
  ) {
    final newItem = AddPage(
      image: savedImage,
      title: savedtitle,
    );
    _items.add(newItem);
    notifyListeners();
  }
}
