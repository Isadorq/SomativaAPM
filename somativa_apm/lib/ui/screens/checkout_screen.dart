import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/bag_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String paymentMethod = "Cartão"; 

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
                  leading: Image.asset(dish.imageUrl, width: 50, fit: BoxFit.cover),
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
                    Text(
                      bag.shipping == 0
                          ? "Grátis 🎉"
                          : "R\$ ${bag.shipping.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: bag.shipping == 0 ? Colors.green : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

                const Text("Forma de pagamento:", style: TextStyle(fontWeight: FontWeight.bold)),
                RadioListTile(
                  title: const Text("Cartão"),
                  value: "Cartão",
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() => paymentMethod = value!);
                  },
                ),
                RadioListTile(
                  title: const Text("Pix"),
                  value: "Pix",
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() => paymentMethod = value!);
                  },
                ),
                RadioListTile(
                  title: const Text("Dinheiro"),
                  value: "Dinheiro",
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() => paymentMethod = value!);
                  },
                ),

                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/confirmation", arguments: paymentMethod);
                  },
                  child: Text("Finalizar Pedido com $paymentMethod"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
