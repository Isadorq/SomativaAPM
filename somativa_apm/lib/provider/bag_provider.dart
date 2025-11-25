import 'package:flutter/material.dart';
import 'package:somativa_apm/model/dish.dart';

class BagProvider extends ChangeNotifier {
  List<Dish> dishesOnBag = [];

  addAllDishes(List<Dish> dishes) {
    dishesOnBag.addAll(dishes);
    notifyListeners();
  }

  removeDish(Dish dish) {
    dishesOnBag.remove(dish);
    notifyListeners();
  }

  clearBag() async {
    dishesOnBag.clear();
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 100));
  }

  Map<Dish, int> getMapByAmount() {
    Map<Dish, int> mapResult = {};
    for (Dish dish in dishesOnBag) {
      if (mapResult[dish] == null) {
        mapResult[dish] = 1;
      } else {
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }
    return mapResult;
  }

  @override
  String toString() => 'BagProvider(dishesOnBag: $dishesOnBag)';
}
