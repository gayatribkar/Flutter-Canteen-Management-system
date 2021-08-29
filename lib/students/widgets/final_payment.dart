import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/meal_data.dart';
import 'package:flutter_smart_home_ui/students/screens/coupon.dart';
import 'package:provider/provider.dart';

class FinalPayment extends StatefulWidget {
  static const routeName = '/final-Payment';

  @override
  _FinalPaymentState createState() => _FinalPaymentState();
}

class _FinalPaymentState extends State<FinalPayment> {
  int selectedRadiaValue = 0;
  int selectedRadiaValue1 = 0;
  bool showBottomBar = false;

  void changeRadioGroupValue(int value) {
    setState(() {
      selectedRadiaValue = value;
      showBottomBar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<MealDesData>(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    //final orderHistoryProvider = Provider.of<OrderHistoryData>(context);
    final totalAmount = routeArgs['totalPrice'];
    // final orderedItemsData = routeArgs['OrderHistoryInfo'];
    // final cartMealsData = routeArgs['cartMealsInfo'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CheckOut',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: showBottomBar
          ? Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.07,
              child: RaisedButton(
                color: Color(0xff00001a),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .popAndPushNamed(ConfirmationCoupon.routeName);
                },
              ),
            )
          : Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.07,
              child: RaisedButton(
                color: Colors.grey,
                child: Text(
                  'Select an Payment Option',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.amber[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          'Total Amount: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: 5,
                        ),
                        child: Text(
                          'Rs $totalAmount',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Payment Options: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 15),
                child: Text(
                  'UPI: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAlertDialog(context, selectedRadiaValue, 1);
                  });
                },
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(left: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: selectedRadiaValue,
                            onChanged: (value) {},
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn-images-1.medium.com/max/1200/1*c6vHWp2F5UQTBM05UgQe8w.jpeg'),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.08,
                            margin: EdgeInsets.only(right: 8),
                          ),
                          Text(
                            'Paytm UPI',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAlertDialog(context, selectedRadiaValue, 2);
                  });
                },
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(left: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: selectedRadiaValue,
                            onChanged: (value) {},
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'data:image/png;base64,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')),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.08,
                            margin: EdgeInsets.only(right: 8),
                          ),
                          Text(
                            'Google Pay',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAlertDialog(context, selectedRadiaValue, 3);
                  });
                },
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(left: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: selectedRadiaValue,
                            onChanged: (value) {},
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://pbs.twimg.com/profile_images/814869197025148928/sdmlM4R-_400x400.jpg')),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.08,
                            margin: EdgeInsets.only(right: 8),
                          ),
                          Text(
                            'bhim UPI',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 15),
                child: Text(
                  'Credit/Debit Cards: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Add Debit/Credit/ATM Card',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Card Number',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: TextField(
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: 'Expiry MM',
                                        hintStyle: TextStyle(
                                          color: Colors.black54,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: TextField(
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: 'CVV',
                                        hintStyle: TextStyle(
                                          color: Colors.black54,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Name on Card',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: RaisedButton(
                                  color: Color(0xff00001a).withOpacity(0.8),
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      changeRadioGroupValue(5);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(left: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Radio(
                            value: 5,
                            groupValue: selectedRadiaValue,
                            onChanged: (value) {},
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://icons-for-free.com/iconfiles/png/512/credit+card+debit+card+master+card+icon-1320184902602310693.png')),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.08,
                            margin: EdgeInsets.only(right: 8),
                          ),
                          Text(
                            'Pay with Credit/Debit Card',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 15),
                child: Text(
                  'More: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRadiaValue != 6
                        ? selectedRadiaValue = 6
                        : selectedRadiaValue = 0;
                  });
                },
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(left: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Radio(
                            value: 6,
                            groupValue: selectedRadiaValue,
                            onChanged: (value) {},
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.flaticon.com/icons/png/512/1554/1554401.png')),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.08,
                            margin: EdgeInsets.only(right: 8),
                          ),
                          Text(
                            'Cash On Delivery',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, int selectedRadiaValue, int value) {
    // Create button
    Widget okButton = FlatButton(
      child: Text(
        "Link Account",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: () {
        changeRadioGroupValue(value);
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Enter Linked Phone Number:",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: TextField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Ex: 1234567891',
          hintStyle: TextStyle(
            color: Colors.grey,
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
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
