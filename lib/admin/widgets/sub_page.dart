import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/admin/screens/add_page.dart';
import '../../Models/meals_defination.dart';
import 'package:provider/provider.dart';
import '../../provider/meal_data.dart';

class SubPage extends StatefulWidget {
  static const routeName = "/subPage";
  final String category;

  SubPage(this.category);

  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  int selectedRadiaValue = 0;
  int selectedRadiaValue1 = 0;
  bool showBottomBar = false;

  void changeRadioGroupValue(int value) {
    setState(() {
      selectedRadiaValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealDesData>(context);
    final mealInfo = mealProvider.getCategorieMeal(widget.category);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddScreen(widget.category),
                  
                ),
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 8, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                ),
              ],
            ),
            child: TextField(
              style: TextStyle(
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search previous orders...',
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width * 0.5,
              child: ListView.builder(
                itemCount: mealInfo.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Container(
                        child: Checkbox(
                          value: mealInfo[index].isSelected,
                          onChanged: (value) {
                            mealProvider.changeSelected(mealInfo[index].id);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 12, right: 5, top: 8, bottom: 3),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(mealInfo[index].iconImage),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Column(
                          children: [
                            Text(mealInfo[index].title),
                            Text('Rs.${mealInfo[index].price.toString()}'),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
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
    );
    //   showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return alert;
    //   },
    // );
  }
}
