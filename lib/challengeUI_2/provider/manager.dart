import 'package:flutter/material.dart';
import 'package:food_app/challengeUI_2/provider/NotifierList.dart';

class Management extends InheritedWidget {
  final dataFood = DataFood();
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static Management of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Management>();
  }
}
