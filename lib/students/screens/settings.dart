import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/user_data.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/student_drawer.dart';

// import '../widgets/order_history_widget.dart';
// import '../provider/user_data.dart';

// ignore: must_be_immutable
// class Settings  extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
//static const routename = "/settings-page";

// ignore: must_be_immutable
class Settings extends StatelessWidget {
  static const routeName = "/settings-page";
  bool _expanded = false;
  bool _expandedTwo = false;
  final inputtedThing1 = TextEditingController();
  final inputtedThing2 = TextEditingController();
  final inputtedThing3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userHolderData = Provider.of<UserDataAdmin>(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final id = routeArgs['id'];
    final userData = userHolderData.getSingleUserData(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
      ),
      drawer: StudentDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(userData.firstName),
                    subtitle: Text('${userData.phoneNo} | ${userData.emailId}'),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20,
                        color: Color(0xff00001a),
                      ),
                      onPressed: () {
                        showAlertDialog(context, inputtedThing1, inputtedThing2,
                            userHolderData, userData.id);
                      },
                    ),
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Color(0xff00001a),
                  ),
                  ListTile(
                    title: Text('My Account'),
                    subtitle: Text('Addresses, Favorites & Offers'),
                    trailing: IconButton(
                      icon: Icon(
                        _expanded ? Icons.expand_less : Icons.expand_more,
                        color: Color(0xff00001a),
                      ),
                      onPressed: () {
                        // setState(() {
                        //   _expanded = !_expanded;
                        // });
                      },
                    ),
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Color(0xff00001a),
                  ),
                  if (_expanded)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: <Widget>[
                              Text(
                                'Manage Address',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15.0,
                                    color: Color(0xff00001a),
                                  ),
                                  onPressed: () {
                                    showAlertDialog(BuildContext context) {
                                      Widget editButton = FlatButton(
                                        child: Text("Update"),
                                        onPressed: () {
                                          // Navigator.of(context).pop();
                                          // userHolderData.updateAddress(
                                          //     id: userData.id,
                                          //     newAddress: inputtedThing3.text);
                                        },
                                      );
                                      AlertDialog alert = AlertDialog(
                                        content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.06,
                                                      child: Text(
                                                        "Edit",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff00001a),
                                                        ),
                                                      ),
                                                    ),
                                                    TextField(
                                                      controller:
                                                          inputtedThing3,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            userData.address,
                                                        hintStyle: TextStyle(
                                                          color: Colors.black87,
                                                        ),
                                                        prefixIcon: Icon(
                                                          Icons.home,
                                                          color:
                                                              Color(0xff00001a),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10.0)),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff00001a)),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10.0)),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff00001a)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ]),
                                          ),
                                        ),
                                        actions: [editButton],
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                    }

                                    showAlertDialog(context);
                                  })
                            ],
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Favourites',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15.0,
                                      color: Color(0xff00001a),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/Favorite_page');
                                    })
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Offers!',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15.0,
                                      color: Color(0xff00001a),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/Offers_page');
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ListTile(
                    title: Text('Payments'),
                    subtitle: Text('Account Options'),
                    trailing: IconButton(
                      icon: Icon(
                        _expandedTwo ? Icons.expand_less : Icons.expand_more,
                        color: Color(0xff00001a),
                      ),
                      onPressed: () {
                        // setState(() {
                        //   _expandedTwo = !_expandedTwo;
                        // });
                      },
                    ),
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Color(0xff00001a),
                  ),
                  if (_expandedTwo)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Account Options',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.0,
                                color: Color(0xff00001a),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/Payment_page');
                              })
                        ],
                      ),
                    ),
                  ListTile(
                    title: Text('Help'),
                    subtitle: Text('FAQs and Links'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15.0,
                          color: Color(0xff00001a),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/Help_page');
                        }),
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Color(0xff00001a),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 5,
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    color: Colors.grey[300],
                    child: Row(
                      children: [
                        Text(
                          'Past Orders',
                        )
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: OrderHistoryWidget(),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, TextEditingController one,
    TextEditingController two, UserDataAdmin userData, String id) {
  Widget editButton = FlatButton(
    child: Text("Update"),
    onPressed: () {
      Navigator.of(context).pop();
      userData.updateEmaPho(
        id: id,
        newEmailId: two.text,
        newPhoneNumber: int.parse(one.text),
      );
    },
  );

  AlertDialog alert = AlertDialog(
    content: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Text(
                "Edit",
                style: TextStyle(
                  color: Color(0xff00001a),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextField(
                controller: one,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextField(
                controller: two,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'EmailID',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            )
          ]),
        )),
    actions: [
      editButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
