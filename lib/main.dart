import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/add_page_provider.dart';
import 'package:flutter_smart_home_ui/provider/user_data.dart';
import 'package:flutter_smart_home_ui/students/screens/homePage.dart';
import 'package:flutter_smart_home_ui/students/screens/settings.dart';
import 'package:flutter_smart_home_ui/students/widgets/meal_des_widget.dart';
import './students/screens/faq_screen.dart';

import 'package:provider/provider.dart';
import 'Login/loginData/sigin_page.dart';
import 'Login/loginData/register_page.dart';
import 'package:flutter/widgets.dart';
import './provider/meal_data.dart';

import './admin/screens/admin_home.dart';
import './admin/screens/admin_faq.dart';

import './admin/screens/add_page.dart';
import './students/screens/cart.dart';
import './students/widgets/final_payment.dart';
import './students/screens/coupon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserDataAdmin(),
        ),
        ChangeNotifierProvider.value(value: MealDesData()),
        ChangeNotifierProvider.value(value: AddData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'I2IT Canteen',
        theme: ThemeData(
          primarySwatch: MaterialColor(Color(0xff00001a).value, {
            50: Color(0xffe5e5ff),
            100: Color(0xffb3b3ff),
            200: Color(0xff8080ff),
            300: Color(0xff4d4dff),
            400: Color(0xff1a1aff),
            500: Color(0xff0000e6),
            600: Color(0xff0000b3),
            700: Color(0xff000080),
            800: Color(0xff00004d),
            900: Color(0xff00001a),
          }),
        ),
        home: SignInPage(),
        routes: {
          RegisterPage.routeName: (ctx) => RegisterPage(),
          MyHomePage.routeName: (ctx) => MyHomePage(),
          Admin.routeName: (ctx) => Admin(),
          // MyAdminHomePage.routeName: (ctx) => MyAdminHomePage(),
          FAQs.routeName: (ctx) => FAQs(),
          Settings.routeName: (ctx) => Settings(),
          AdminFAQ.routeName: (ctx) => AdminFAQ(),
          MealDes.routename: (ctx) => MealDes(),
          // AddScreen.routeName: (ctx) => AddScreen(),
          MyCart.routeName: (ctx) => MyCart(),
          FinalPayment.routeName: (ctx) => FinalPayment(),
          ConfirmationCoupon.routeName: (ctx) => ConfirmationCoupon(),
          // SubPage.routeName:(ctx)=>SubPage()
        },
      ),
    );
  }
}
