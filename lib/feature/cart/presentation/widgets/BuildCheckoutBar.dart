import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildCheckoutBar extends StatelessWidget {
  const BuildCheckoutBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.07))),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
            ),
            borderRadius: BorderRadius.circular(28),
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(' تم عملية الشراء بنجاح✓')),
              );
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            icon: const Icon(
              Icons.shopping_cart_checkout_rounded,
              color: Colors.white,
              size: 20,
            ),
            label: const Text(
              'إتمام عملية الشراء',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
