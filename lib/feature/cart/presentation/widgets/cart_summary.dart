import 'package:apppp/feature/cart/presentation/bloc/cart_state.dart';
import 'package:apppp/feature/cart/presentation/widgets/cart_summary_row.dart';
import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final CartState state;
  const CartSummary({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.08))),
      ),
      child: Column(
        children: [
          SummaryRow(label: 'عدد الأصناف', value: '${state.totalItems} صنف'),
          const SizedBox(height: 8),
          SummaryRow(
            label: 'الإجمالي',
            value: '${state.totalPrice} ج.م',
            isTotal: true,
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE07B2A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: const Text(
                'تأكيد الطلب',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
