import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:somativa_apm/provider/bag_provider.dart';
import 'package:somativa_apm/data/restaurant_data.dart';
import 'package:somativa_apm/ui/widgets/checkout/checkoutscreen.dart';
import 'package:somativa_apm/ui/widgets/dish_card.dart';
import 'package:somativa_apm/ui/core/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantData = Provider.of<RestaurantData>(context);
    final bagProvider = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio - Mange Eats', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Checkoutscreen()),
                  );
                },
              ),
              if (bagProvider.totalItems > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${bagProvider.totalItems}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: restaurantData.isLoading
          ? const Center(child: CircularProgressIndicator())
          : restaurantData.dishes.isEmpty
              ? const Center(child: Text('Nenhum prato disponível.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: restaurantData.dishes.length,
                  itemBuilder: (context, index) {
                    final dish = restaurantData.dishes[index];
                    return DishCard(dish: dish);
                  },
                ),
    );
  }
}
