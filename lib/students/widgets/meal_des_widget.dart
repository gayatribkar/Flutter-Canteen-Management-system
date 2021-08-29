import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/Models/meals_defination.dart';
import 'package:provider/provider.dart';
import '../../provider/meal_data.dart';

class MealDes extends StatelessWidget {
  static const routename = '/meal-des';

  List<int> getCounters(List<MealData> data) {
    return data.map((e) => e.counter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final mealInfo = Provider.of<MealDesData>(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final MealData mealData = routeArgs['mealData'];
    final cartMeals = mealInfo.getCartMeal();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealData.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(mealData.iconImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    mealData.title + '  Rs.${mealData.price}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: EdgeInsets.only(left: 10, right: 10),
                // child: ListView.builder(
                //   itemCount: mealData.description.length,
                //   itemBuilder: (context, index) {
                //     return Text(
                //       mealData.description[index],
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     );
                //   },
                // ),
                child: Text(mealData.description),
              ),
              !mealData.isCart
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          mealInfo.addToCart(mealData.id);
                        },
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                mealData.counter > 0
                                    ? mealInfo.decrementCounter(mealData.id)
                                    : mealInfo.deleteItem(mealData.id);
                              }),
                          Text(
                            '${mealInfo.item.firstWhere((element) => element.id == mealData.id).counter}',
                          ),
                          IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {
                                mealInfo.incrementCounter(mealData.id);
                              }),
                        ],
                      ),
                    ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: mealData.isCart
          ? Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
              child: RaisedButton(
                color: Color(0xff00001a),
                child: Row(
                  children: [
                    Text(
                      '${mealInfo.item.firstWhere((element) => element.id == mealData.id).counter} items | Rs.${mealInfo.item.firstWhere((element) => element.id == mealData.id).counter * mealData.price} ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            )
          : Container(
              height: 0,
            ),
    );
  }
}
