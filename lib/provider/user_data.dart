import 'package:flutter/material.dart';

import '../Models/userData_def.dart';

class UserDataAdmin with ChangeNotifier {
  List<UserDataDefenation> _items = [
    UserDataDefenation(
      address: 'Flat No. {int}, {Society Name} {City}-{Pincode}',
      emailId: 'i2it@gmail.com',
      firstName: 'canteen',
      id: '001',
      lastName: 'i2it',
      password: 'i2it',
      phoneNo: 123456789,
    ),
    UserDataDefenation(
      address: 'Flat No. {int}, {Society Name} {City}-{Pincode}',
      emailId: 'shivani@gmail.com',
      firstName: 'shivani',
      id: '002',
      lastName: 'Bhinge',
      password: 'shivani',
      phoneNo: 123456781,
    ),
    UserDataDefenation(
      address: 'Flat No. {int}, {Society Name} {City}-{Pincode}',
      emailId: 'gayatri@gmail.com',
      firstName: 'Gayatri',
      id: '003',
      lastName: 'Bhatambarekar',
      password: 'gayatri',
      phoneNo: 123456782,
    ),
  ];

  List<UserDataDefenation> get items {
    return [..._items];
  }

  void addUserData(UserDataDefenation addItem) {
    _items.add(addItem);
    notifyListeners();
  }

  UserDataDefenation getSingleUserData(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void updateEmaPho({String id, int newPhoneNumber, String newEmailId}) {
    var toBeUpdatedItem = _items.firstWhere((element) => element.id == id);
    toBeUpdatedItem.phoneNo = newPhoneNumber;
    toBeUpdatedItem.emailId = newEmailId;
    notifyListeners();
  }

  
}

