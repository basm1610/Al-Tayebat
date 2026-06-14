import 'package:apppp/core/constant/app_color.dart';
import 'package:apppp/feature/cart/presentation/pages/cartPage.dart';
import 'package:flutter/material.dart';

class BuildBottomBarFoodDetails extends StatelessWidget {
  const BuildBottomBarFoodDetails({super.key, required this.total});

  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.07))),
      ),
      child: Row(
        children: [
          // Add to cart button
          Expanded(
            child: SizedBox(
              height: 54,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
                  ),
                  borderRadius: BorderRadius.circular(27),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.kOrange.withOpacity(0.35),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => CartScreen()));
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                  icon: const Icon(
                    Icons.shopping_basket_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: const Text(
                    'أضف للسلة',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Total
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الإجمالي',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              Row(
                children: [
                  Text(
                    ' ج.م',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  Text(
                    '${total.toInt()}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
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
