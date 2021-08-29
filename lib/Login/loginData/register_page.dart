import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/user_data.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_smart_home_ui/Models/userData_def.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/RegisterPage';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final inputtedFirstName = TextEditingController();
  final inputtedLastName = TextEditingController();
  final inputtedPhoneNo = TextEditingController();
  final inputtedEmailId = TextEditingController();
  final inputtedPassword = TextEditingController();
  final inputtedAddress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataAdmin>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          margin: EdgeInsets.only(left: 30, top: 50, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Create Account',
                style: GoogleFonts.andika(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              // Text(
              //   'Sign Up to get started',
              //   style: GoogleFonts.andika(
              //     color: Colors.black,
              //     fontWeight: FontWeight.w500,
              //     fontSize: 30,
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: inputtedFirstName,
                    decoration: InputDecoration(
                      hintText: 'Enter First Name',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  )),

              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: inputtedLastName,
                    decoration: InputDecoration(
                      hintText: 'Enter Last Name',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  )),

              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: inputtedPhoneNo,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  )),

              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: inputtedEmailId,
                    decoration: InputDecoration(
                      hintText: 'Enter Email Id',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  )),

              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: inputtedPassword,
                    decoration: InputDecoration(
                      hintText: 'Enter Passsword',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  )),

              Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: inputtedAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter Address',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  )),

              Container(
                margin: EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    setState(() {
                      userDataProvider.addUserData(
                        UserDataDefenation(
                          address: inputtedAddress.text,
                          emailId: inputtedEmailId.text,
                          firstName: inputtedFirstName.text,
                          lastName: inputtedLastName.text,
                          password: inputtedPassword.text,
                          phoneNo: int.parse(inputtedPhoneNo.text),
                          id: DateTime.now().toString(),
                        ),
                      );
                    });

                    Navigator.of(context).popAndPushNamed('/SignInPage');
                  },
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'SignUp',
                      style: GoogleFonts.andika(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  //  onPressed: () {
                  //   userDataProvider.addUserData(
                  //     UserDataDefenation(
                  //       address: inputtedAddress.text,
                  //       emailId: inputtedEmailId.text,
                  //       firstName: inputtedFirstName.text,
                  //       lastName: inputtedLastName.text,
                  //       password: inputtedPassword.text,
                  //       phoneNo: int.parse(inputtedPhoneNo.text),
                  //       id: DateTime.now().toString(),
                  //     ),
                  //   );
                  //   Navigator.of(context).popAndPushNamed('/SignIn');
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
