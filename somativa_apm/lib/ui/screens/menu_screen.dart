import 'package:flutter/material.dart';
import '../../data/mock_dishes.dart';
import '../widgets/dish_card.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cardápio")),
      body: ListView(children: mockDishes.map((e)=> DishCard(dish: e)).toList())
    );
  }
}
