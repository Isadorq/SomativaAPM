import 'package:somativa_apm/model/dish.dart';
import 'package:somativa_apm/ui/core/app_colors.dart';
import 'package:somativa_apm/provider/bag_provider.dart';
import 'package:somativa_apm/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkoutscreen extends StatefulWidget {
  const Checkoutscreen({super.key});

  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  final TextEditingController _cepController = TextEditingController();
  final ApiService _apiService = ApiService();

  String _address = 'Endereço não definido. Busque o CEP.';
  bool _isCepLoading = false;
  double _freightValue = 0.0;

  static const double standardFreight = 10.00;
  static const double freeFreightThreshold = 100.00;

  Future<void> _searchCep(double subtotal) async {
    final cep = _cepController.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (cep.length != 8) {
      setState(() {
        _address = 'CEP inválido.';
        _freightValue = 0.0;
      });
      return;
    }

    setState(() {
      _isCepLoading = true;
      _address = 'Buscando endereço...';
    });

    try {
      final data = await _apiService.fetchAddressByCep(cep);
      _address =
          '${data['logradouro']}, ${data['bairro']} - ${data['localidade']}/${data['uf']}';
      _freightValue =
          subtotal > freeFreightThreshold ? 0.0 : standardFreight;
    } catch (e) {
      _address = 'CEP não encontrado ou erro na busca.';
      _freightValue = 0.0;
    } finally {
      setState(() {
        _isCepLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bagProvider = Provider.of<BagProvider>(context);

    double subtotal = 0;
    bagProvider.getMapByAmount().forEach((dish, amount) {
      subtotal += (dish.price / 100) * amount;
    });

    double finalTotal = subtotal + _freightValue;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sacola'),
        actions: [
          TextButton(
            onPressed: () {
              bagProvider.clearBag();
              setState(() {
                _freightValue = 0.0;
                _address = 'Endereço não definido. Busque o CEP.';
              });
            },
            child: const Text('Limpar'),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pedidos',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(
                bagProvider.getMapByAmount().keys.length,
                (index) {
                  Dish dish =
                      bagProvider.getMapByAmount().keys.toList()[index];
                  int amount = bagProvider.getMapByAmount()[dish]!;

                  return ListTile(
                    leading: Image.asset(
                      'assets/dishes/default.png',
                      width: 48,
                      height: 48,
                    ),
                    title: Text('${dish.name} x $amount'),
                    subtitle: Text(
                      'R\$${((dish.price / 100) * amount).toStringAsFixed(2)}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => bagProvider.removeDish(dish),
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        IconButton(
                          onPressed: () =>
                              bagProvider.addAllDishes([dish]),
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            const Divider(color: AppColors.lightBackgroundColor),
            const Text(
              'Local de Entrega',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cepController,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    decoration: const InputDecoration(
                      labelText: 'CEP',
                      hintText: 'Digite o CEP',
                      counterText: "",
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _isCepLoading
                        ? null
                        : () => _searchCep(subtotal),
                    child: _isCepLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text('Buscar'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Endereço: $_address',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal:', style: TextStyle(fontSize: 16)),
                Text(
                  'R\$${subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Frete:', style: TextStyle(fontSize: 16)),
                Text(
                  _freightValue == 0.0 &&
                          subtotal >= freeFreightThreshold &&
                          _address !=
                              'Endereço não definido. Busque o CEP.'
                      ? 'GRÁTIS'
                      : 'R\$${_freightValue.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        _freightValue == 0.0 ? Colors.green : Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.mainColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Final:',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'R\$${finalTotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: subtotal > 0
                  ? () {
                      bagProvider.clearBag();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Pedido realizado!'),
                        ),
                      );
                      Navigator.popUntil(
                          context, (route) => route.isFirst);
                    }
                  : null,
              child: const Text('Pedir', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
