import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/meal_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import '../widgets/sub_page.dart';

class AddScreen extends StatefulWidget {
  String cat;
  AddScreen(this.cat);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _title = TextEditingController();
  final _price = TextEditingController();
  final _description = TextEditingController();

  String _fromDate;
  String _toDate;

  File _selectedImage;
  Future<void> getLocation() async {
    final image = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 600);
    if (image == null) {
      return;
    }
    setState(() {
      _selectedImage = File(image.path);
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final savedImage = await File(image.path).copy('${appDir.path}/$fileName');
  }

  String dropdownValue;
  String dropdownValueTwo;
  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealDesData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Item',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    left: 10,
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: TextFormField(
                    controller: _title,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Enter Title',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(color: Colors.black),
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
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.75,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.only(top: 15, right: 10),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.45,
                  // child: DropdownButton<String>(
                  //   value: dropdownValue,
                  //   hint: Text('Categories'),
                  //   icon: Icon(Icons.arrow_drop_down_outlined),
                  //   onChanged: (newValue) {
                  //     setState(() {
                  //       dropdownValue = newValue;
                  //     });
                  //   },
                  //   items: <String>['Lunch', 'Breakfast', 'Dinner', 'Others']
                  //       .map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),
                  child: Center(
                    child: Text(widget.cat),
                  ),
                  // child: ListTile(

                  //   title: Text(
                  //     'Categories',
                  //   ),

                  //   trailing: IconButton(
                  //     icon: Icon(
                  //       Icons.edit,

                  //     ),
                  //     onPressed: (){},
                  //   ),
                  //   ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ),
                  color: Colors.grey[400],
                  child: _selectedImage == null
                      ? Center(
                          child: Text('No Image!'),
                        )
                      : Image.file(
                          _selectedImage,
                          fit: BoxFit.cover,
                        ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.2,
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 50,
                  ),
                  child: RaisedButton(
                    onPressed: getLocation,
                    child: Text('Upload Picture'),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ),
                  child: TextField(
                    controller: _description,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: DropdownButton<String>(
                    value: dropdownValueTwo,
                    hint: Text('Veg/Non-Veg'),
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValueTwo = newValue;
                      });
                    },
                    items: <String>['Veg', 'Non-Veg']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  // child: ListTile(
                  //   title: Text(
                  //     'Veg/Non-Veg',
                  //   ),
                  //   trailing: IconButton(
                  //     icon: Icon(
                  //       Icons.arrow_drop_down,
                  //     ),
                  //     onPressed: (){},
                  //   ),
                  //   )
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: TextField(
                    controller: _price,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Set Price',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(color: Colors.black),
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
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      children: [
                        Center(
                          child: Text(
                            'From: ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        _fromDate == null
                            ? TextButton(
                                child: Text('Select Time'),
                                onPressed: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    setState(() {
                                      String selectedHour =
                                          value.hour.toString();
                                      String selectedMin =
                                          value.minute.toString();
                                      _fromDate =
                                          selectedHour + ':' + selectedMin;
                                      // print(_fromDate);
                                    });
                                  });
                                },
                              )
                            : Text(
                                _fromDate,
                                style: TextStyle(fontSize: 20),
                              ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      children: [
                        Center(
                          child: Text(
                            'To: ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        _toDate == null
                            ? TextButton(
                                child: Text('Select Time'),
                                onPressed: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    setState(() {
                                      String selectedHour =
                                          value.hour.toString();
                                      String selectedMin =
                                          value.minute.toString();
                                      _toDate =
                                          selectedHour + ':' + selectedMin;
                                      // print(_fromDate);
                                    });
                                  });
                                },
                              )
                            : Text(
                                _toDate,
                                style: TextStyle(fontSize: 20),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: 10,
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              child: RaisedButton(
                  color: Color(0xff00001a),
                  child: Text(
                    'Add Item',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // ...............
                    mealProvider.add(
                      _title.text,
                      _selectedImage,
                      widget.cat,
                      _description.text,
                      int.parse(_price.text),
                      _title.text,
                      _fromDate,
                      _toDate,
                      context,
                    );
                    Navigator.of(context).pop();
                    // Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => SubPage("lunch"),
                    // ));
                  }),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("Set"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Text(
            'Set Time',
          ),
          // TextField(
          //   style: TextStyle(color: Colors.black),
          //   decoration: InputDecoration(
          //     hintText: 'From',
          //     hintStyle: TextStyle(
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          // TextField(
          //   style: TextStyle(color: Colors.black),
          //   decoration: InputDecoration(
          //     hintText: 'To',
          //     hintStyle: TextStyle(
          //       color: Colors.black,
          //     ),
          //   ),
          // )
          Container(
            height: 50,
            child: Row(
              children: [
                Text('From: '),
                _fromDate == null
                    ? FlatButton(
                        child: Text('Select Time'),
                        onPressed: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            setState(() {
                              String selectedHour = value.hour.toString();
                              String selectedMin = value.minute.toString();
                              _fromDate = selectedHour + ':' + selectedMin;
                              // print(_fromDate);
                            });
                          });
                        },
                      )
                    : Text(_fromDate),
              ],
            ),
          )
        ],
      ),
      //  ListTile(
      //   leading: Icon(
      //     Icons.info_outline_rounded,
      //     color: Colors.black,
      //     size: 50,
      //   ),
      //   title: Text(
      //     'Error!!',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 30,
      //     ),
      //   ),
      // ),

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
