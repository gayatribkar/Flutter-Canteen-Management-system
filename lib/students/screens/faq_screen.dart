import 'package:flutter/material.dart';

import '../widgets/faq_widget.dart';
import '../widgets/student_drawer.dart';
import '../../provider/faq_data.dart';

class FAQs extends StatelessWidget {
  static const routeName = '/faqs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      drawer: StudentDrawer(),
      body: FaqWidget(faqQuestions),
    );
  }
}
