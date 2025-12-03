import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/bag_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bag = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bag.dishes.length,
              itemBuilder: (context, index) {
                final dish = bag.dishes[index];
                return ListTile(
                  leading: Image.network(dish.imageUrl, width: 50),
                  title: Text(dish.name),
                  subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () => bag.removeDish(dish),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal"),
                    Text("R\$ ${bag.subtotal.toStringAsFixed(2)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Frete"),
                    Text("R\$ ${bag.shipping.toStringAsFixed(2)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("R\$ ${bag.total.toStringAsFixed(2)}"),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Pedido finalizado!")),
                    );
                    bag.clearBag();
                    Navigator.pop(context);
                  },
                  child: const Text("Finalizar Pedido"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
