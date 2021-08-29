import 'package:flutter/material.dart';

import '../../Models/faqs_defenation.dart';

// ignore: must_be_immutable
class FaqWidget extends StatefulWidget {
  List<FAQ> questions;
  FaqWidget(this.questions);
  @override
  _FaqWidgetState createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  @override
  Widget build(BuildContext context) {
    List<FAQ> faqData = widget.questions;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ExpansionPanelList(
              animationDuration: Duration(seconds: 1),
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          faqData[index].answers,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        faqData[index].questions,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    );
                  },
                  isExpanded: faqData[index].isExpanded,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  faqData[index].isExpanded = !faqData[index].isExpanded;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
