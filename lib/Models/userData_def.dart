import 'package:flutter/foundation.dart';

class UserDataDefenation {
  final String firstName;
  final String lastName;
  final String password;
  final String id;
  String emailId;
  int phoneNo;
  String address;

  UserDataDefenation({
    @required this.emailId,
    @required this.firstName,
    @required this.id,
    @required this.lastName,
    @required this.password,
    @required this.phoneNo,
    @required this.address,
  });
}
