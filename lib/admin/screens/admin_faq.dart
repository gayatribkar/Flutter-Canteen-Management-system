import 'package:flutter/material.dart';

import '../../students/widgets/faq_widget.dart';
import '../widgets/admin_drawer.dart';

import '../../provider/adminfaq_data.dart';

class AdminFAQ extends StatelessWidget {
  static const routeName = '/adminfaqs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      drawer: AdminDrawer(),
      body: FaqWidget(adminfaqQuestions),
    );
  }
}
