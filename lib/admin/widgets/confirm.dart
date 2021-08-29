import 'package:flutter/material.dart';

class ConfirmationCoupon extends StatelessWidget {
  static const routeName = '/confirmation-coupon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Order Confirmation',
          ),
        ),
        body: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 45,
              ),
              child: Text(
                'Order Placed Successfully!!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://p.kindpng.com/picc/s/405-4059088_icon-transparent-background-green-check-mark-hd-png.png'))),
            ),
          ],
        )));
  }
}
