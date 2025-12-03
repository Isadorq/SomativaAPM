import 'package:flutter/material.dart';
import '../model/dish.dart';

class BagProvider with ChangeNotifier {
  final List<Dish> _dishes = [];

  List<Dish> get dishes => _dishes;

  double get subtotal =>
      _dishes.fold(0, (sum, dish) => sum + dish.price);

  double get shipping => subtotal > 100 ? 0 : 15;

  double get total => subtotal + shipping;

  void addDish(Dish dish) {
    _dishes.add(dish);
    notifyListeners();
  }

  void removeDish(Dish dish) {
    _dishes.remove(dish);
    notifyListeners();
  }

  void clearBag() {
    _dishes.clear();
    notifyListeners();
  }
}
