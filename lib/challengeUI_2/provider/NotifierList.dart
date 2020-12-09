import 'package:flutter/foundation.dart';
import 'package:food_app/challengeUI_2/model/foodModel.dart';
import 'package:food_app/challengeUI_2/model/food_data.dart';

class DataFood extends ValueNotifier<List<Categorie>> {
  DataFood() : super(FOOD_CATEGORIE);

  void add() {
    notifyListeners();
  }
}
