import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/bag_provider.dart';
import '../../core/app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bagProvider = Provider.of<BagProvider>(context);
    final bag = bagProvider.dishes;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
        backgroundColor: AppColors.primary,
      ),
      body: bag.isEmpty
          ? const Center(
              child: Text("Carrinho vazio"),
            )
          : ListView.builder(
              itemCount: bag.length,
              itemBuilder: (context, index) {
                final dish = bag[index];

                return ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(dish.imageUrl)),
                  title: Text(dish.name),
                  subtitle: Text("R\$ ${dish.price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => bagProvider.removeDish(dish),
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total: R\$ ${bagProvider.totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18, color: Colors.white)),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Ir para Checkout"),
            )
          ],
        ),
      ),
    );
  }
}
