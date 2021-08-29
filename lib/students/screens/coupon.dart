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
                'Order Confirmed!!',
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
            Container(
              margin: EdgeInsets.only(top: 35),
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xff00001a))),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Text(
                      'Coupon Code: 001',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 15),
                    child: Text(
                      '25/05/2021',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
