import 'package:flutter/material.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 72,
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.15),
          ),
          const SizedBox(height: 16),
          const Text(
            'السلة فارغة',
            style: TextStyle(
              color: Colors.white38,
              fontFamily: 'Cairo',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'أضف أصنافاً من القائمة',
            style: TextStyle(
              color: Colors.white24,
              fontFamily: 'Cairo',
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}