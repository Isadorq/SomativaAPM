import 'package:flutter/material.dart';
import '../../data/mock_dishes.dart';
import '../widgets/dish_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String restaurantName =
        ModalRoute.of(context)!.settings.arguments as String;

    final dishes = mockDishes
        .where((dish) => dish.restaurant == restaurantName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          return DishCard(dish: dishes[index]);
        },
      ),
    );
  }
}
