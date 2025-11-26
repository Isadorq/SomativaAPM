import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/bag_provider.dart';
import '../../services/viacep_service.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String cep = "";
  String endereco = "";
  double taxaEntrega = 0.0;
  bool carregandoCep = false;

  Future<void> buscarCep() async {
    if (cep.length < 8) return;

    setState(() => carregandoCep = true);

    final dados = await ViaCepService.buscarCep(cep);

    if (dados != null) {
      setState(() {
        endereco = "${dados['logradouro']} - ${dados['bairro']} - ${dados['localidade']}";
      });
    }

    setState(() => carregandoCep = false);
  }

  @override
  Widget build(BuildContext context) {
    final bag = Provider.of<BagProvider>(context);
    final subtotal = bag.totalPrice;
    taxaEntrega = subtotal > 100 ? 0 : 8.99;
    final total = subtotal + taxaEntrega;

    return Scaffold(
      appBar: AppBar(title: const Text("Confirmar Pedido")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Endereço de entrega via CEP:", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            TextField(
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Digite seu CEP"),
              onChanged: (value) => cep = value,
              onSubmitted: (_) => buscarCep(),
            ),

            const SizedBox(height: 10),

            carregandoCep
                ? const CircularProgressIndicator()
                : Text(endereco.isEmpty ? "Digite o CEP para buscar endereço" : endereco),

            const Divider(height: 40),

            Text("Subtotal: R\$ ${subtotal.toStringAsFixed(2)}", style: const TextStyle(fontSize: 18)),
            Text("Taxa de entrega: R\$ ${taxaEntrega.toStringAsFixed(2)}", style: const TextStyle(fontSize: 18)),
            Text("TOTAL: R\$ ${total.toStringAsFixed(2)}", style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
            
            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  bag.clearBag(); // 🟢 agora FUNCIONA
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pedido confirmado com sucesso!")),
                  );
                  Navigator.pop(context);
                },
                child: const Text("FINALIZAR PEDIDO"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
