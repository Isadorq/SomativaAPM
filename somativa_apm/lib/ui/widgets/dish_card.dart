import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:somativa_apm/model/dish.dart';
import 'package:somativa_apm/provider/bag_provider.dart';
import 'package:somativa_apm/core/app_colors.dart';
import 'package:intl/intl.dart';

class DishCard extends StatelessWidget {
  final Dish dish;
  
  const DishCard({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    final bagProvider = Provider.of<BagProvider>(context, listen: false);
    final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
      },
      child: Card(
        elevation: 6,
        shadowColor: AppColors.primary.withValues(alpha: 50),
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  dish.imageUrl,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  semanticLabel: 'Imagem do prato ${dish.name}',
                  errorBuilder: (_, __, ___) => Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey[300],
                    child: const Icon(Icons.fastfood_outlined, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dish.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dish.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),

                    Text(
                      currencyFormat.format(dish.price),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: AppColors.secondary,
                      size: 34,
                    ),
                    onPressed: () {
                      bagProvider.addDish(dish);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.primary,
                          duration: const Duration(seconds: 1),
                          content: Text(
                            '${dish.name} adicionado ao carrinho!',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
