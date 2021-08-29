import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/admin/screens/admin_faq.dart';
import '../screens/admin_home.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
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
            child: Text(
              'hello admin',
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Color(0xff00001a),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Admin(),
              ));
            },
          ),
          ListTile(
            title: Text('Monthly track'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Faq'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => AdminFAQ(),
              ));
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
