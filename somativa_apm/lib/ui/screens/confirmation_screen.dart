import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/bag_provider.dart';
import '../../services/viacep_service.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final TextEditingController _cepController = TextEditingController();
  String? _address;
  double? _deliveryFee;

  Future<void> _buscarEndereco() async {
    final data = await ViaCepService.buscarCep(_cepController.text);

    setState(() {
      if (data == null) {
        _address = "CEP inválido ou não encontrado";
        _deliveryFee = null;
      } else {
        _address =
            "${data['logradouro']}, ${data['bairro']} - ${data['localidade']}/${data['uf']}";

        final bag = Provider.of<BagProvider>(context, listen: false);
        _deliveryFee = bag.subtotal > 100 ? 0 : 15;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bag = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Confirmação de Pedido")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Subtotal: R\$ ${bag.subtotal.toStringAsFixed(2)}"),
            const SizedBox(height: 8),

            TextField(
              controller: _cepController,
              decoration: InputDecoration(
                labelText: "Digite seu CEP",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _buscarEndereco,
                ),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),

            if (_address != null)
              Text("Endereço: $_address",
                  style: const TextStyle(fontSize: 16)),

            if (_deliveryFee != null) ...[
              const SizedBox(height: 8),
              Text(
                _deliveryFee == 0
                    ? "Frete: Grátis 🎉"
                    : "Frete: R\$ ${_deliveryFee!.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Total: R\$ ${(bag.subtotal + _deliveryFee!).toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Pedido confirmado!")),
                );
                bag.clearBag();
                Navigator.pop(context);
              },
              child: const Text("Confirmar Pedido"),
            ),
          ],
        ),
      ),
    );
  }
}
