import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/Login/loginData/sigin_page.dart';
import 'package:flutter_smart_home_ui/students/screens/settings.dart';
import '../../students/screens/homePage.dart';
import '../../students/screens/faq_screen.dart';
import '../../students/screens/settings.dart';
import '../../students/screens/cart.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Text(
                'Hello Welcome to i2it Canteen',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xff00001a),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).popAndPushNamed(MyHomePage.routeName,
                  arguments: ({
                    "id": "002",
                  }));
            },
          ),
          ListTile(
            title: Text('Cart'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(MyCart.routeName);
            },
          ),
          ListTile(
            title: Text('Faq'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).popAndPushNamed(FAQs.routeName);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(Settings.routeName,
                  arguments: ({
                    'id': '002',
                  }));
            },
          ),
          Spacer(),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
