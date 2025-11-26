import 'package:flutter/material.dart';
import '../model/dish.dart';

class BagProvider extends ChangeNotifier {
  final List<Dish> _bag = [];

  List<Dish> get dishes => _bag;

  void addDish(Dish dish) {
    _bag.add(dish);
    notifyListeners();
  }

  void removeDish(Dish dish) {
    _bag.remove(dish);
    notifyListeners();
  }

  double get totalPrice {
    return _bag.fold(0, (sum, dish) => sum + dish.price);
  }

  void clearBag() {
    _bag.clear();
    notifyListeners();
  }
}
