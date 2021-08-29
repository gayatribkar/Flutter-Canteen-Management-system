import "package:flutter/foundation.dart";

class FAQ {
  final String questions;
  final String answers;
  final String id;
  bool isExpanded;

  FAQ({
    @required this.answers,
    @required this.id,
    @required this.questions,
    this.isExpanded = false,
  });
}
