import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/user_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I2IT Canteen',
      home: SignInPage(),
      theme: ThemeData(
        backgroundColor: Color(0xff00001a),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  static const routeName = '/SignInPage';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    // var deviceWidth = MediaQuery.of(context).size.width;
    bool _obscureText = true;

    final inputtedUserName = TextEditingController();
    final inputtedPassword = TextEditingController();
    final userDataProvider = Provider.of<UserDataAdmin>(context);
    final userData = userDataProvider.items;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://scontent.fbom3-1.fna.fbcdn.net/v/t31.18172-8/23847482_1895154920512202_7241017864964618277_o.jpg?_nc_cat=101&ccb=3&_nc_sid=6e5ad9&_nc_ohc=6RAKAnRS4-MAX9KE_RE&_nc_ht=scontent.fbom3-1.fna&oh=2937794e9ce84600a3ac14cf76925742&oe=60651F77"),
                  fit: BoxFit.cover)),

          //color: Theme.of(context).backgroundColor,
          height: deviceHeight,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // margin: EdgeInsets.only(bottom: 80),
                  height: MediaQuery.of(context).size.height * 0.25,
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'WELCOME',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'to ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'I2IT ',
                            style: TextStyle(
                                color: Colors.lightBlue[700],
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Canteen ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  child: Container(
                    // color: Theme.of(context).backgroundColor,
                    margin: EdgeInsets.fromLTRB(0, 65, 0, 0),
                    height: 300,
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.black)),
                    padding: EdgeInsets.all(20),
                    child: Card(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.white.withOpacity(0.7),
                      //color: Theme.of(context).backgroundColor,
                      elevation: 20,
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              // style: TextStyle(color: Colors.white),
                              style: TextStyle(color: Colors.black),
                              controller: inputtedUserName,
                              decoration: InputDecoration(
                                hintText: 'EmailId / PhoneNumber',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            margin: EdgeInsets.all(10),
                            child: TextField(
                              obscureText: _obscureText,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              controller: inputtedPassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    semanticLabel: _obscureText
                                        ? 'show password'
                                        : 'hide password',
                                    color: Colors.black,
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  color: Colors.black.withOpacity(0.8),
                                  elevation: 5,
                                  child: FlatButton(
                                    height: 50,
                                    color: Colors.black.withOpacity(0.6),
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent[700],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 110,
                                  child: Card(
                                    color: Colors.black.withOpacity(0.8),
                                    // color: Theme.of(context).backgroundColor,
                                    // margin: EdgeInsets.fromLTRB(220, 0, 0, 0),
                                    child: RaisedButton(
                                      //shape: RoundedRectangleBorder(
                                      //borderRadius:
                                      // BorderRadius.circular(9.0),
                                      // side: BorderSide(color: Colors.black)),
                                      color: Colors.black.withOpacity(0.6),
                                      // color: Theme.of(context).backgroundColor,
                                      elevation: 10,

                                      child: Text(
                                        'LogIn',
                                        style: TextStyle(
                                          color: Colors.lightBlueAccent[700],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      onPressed: () {
                                        var flag = -1;
                                        if (inputtedUserName.text ==
                                                userData[0].emailId ||
                                            inputtedUserName.text ==
                                                userData[0]
                                                    .phoneNo
                                                    .toString()) {
                                          if (inputtedPassword.text ==
                                              userData[0].password) {
                                            Navigator.of(context)
                                                .popAndPushNamed(
                                              '/AdminHome',
                                            );
                                          }
                                        } else {
                                          for (var i = 1;
                                              i < userData.length;
                                              i++) {
                                            if ((inputtedUserName.text ==
                                                    userData[i].emailId ||
                                                inputtedUserName.text ==
                                                    userData[i]
                                                        .phoneNo
                                                        .toString())) {
                                              if (inputtedPassword.text ==
                                                  userData[i].password) {
                                                flag = i;

                                                Navigator.of(context)
                                                    .popAndPushNamed(
                                                        '/StudentHome',
                                                        arguments: ({
                                                          'id': userData[i].id,
                                                        }));
                                              }
                                            }
                                          }

                                          // if (flag == -1) {
                                          //   showAlertDialog(context);
                                          // }
                                        }
                                        setState(() {
                                          inputtedPassword.clear();
                                          inputtedUserName.clear();
                                        });
                                      },
                                      // color: Colors.lightBlueAccent[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      FlatButton(
                          textColor: Colors.lightBlueAccent[700],
                          child: Text('Sign Up'),
                          onPressed: () {
                            Navigator.of(context)
                                .popAndPushNamed('/RegisterPage');
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // showAlertDialog(BuildContext context) {
  //   // Create button
  //   Widget okButton = FlatButton(
  //     child: Text("OK"),
  //     onPressed: () {
  //       Navigator.of(context).pop();
  //     },
  //   );

  //   // Create AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: ListTile(
  //       leading: Icon(
  //         Icons.info_outline_rounded,
  //         color: Colors.black,
  //         size: 50,
  //       ),
  //       title: Text(
  //         'Error!!',
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontWeight: FontWeight.bold,
  //           fontSize: 30,
  //         ),
  //       ),
  //     ),
  //     content: Text("Invalid UserName or Password."),
  //     actions: [
  //       okButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}
