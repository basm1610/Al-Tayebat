import 'package:apppp/feature/cart/data/models/cart-item-model.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_event.dart';
import 'package:apppp/feature/cart/presentation/widgets/qty_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel cartItem;
  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  cartItem.item.name,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  cartItem.selectedSize.name,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.45),
                    fontFamily: 'Cairo',
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${cartItem.totalPrice} ج.م',
                  style: const TextStyle(
                    color: Color(0xFFE07B2A),
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Quantity controls
          Column(
            children: [
              // Delete button
              GestureDetector(
                onTap: () => context.read<CartBloc>().add(
                  RemoveFromCartEvent(cartItem.uniqueKey),
                ),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // +/- controls
              Row(
                children: [
                  QtyButton(
                    icon: Icons.add,
                    onTap: () => context.read<CartBloc>().add(
                      IncrementQuantityEvent(cartItem.uniqueKey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '${cartItem.quantity}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  QtyButton(
                    icon: Icons.remove,
                    onTap: () => context.read<CartBloc>().add(
                      DecrementQuantityEvent(cartItem.uniqueKey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}