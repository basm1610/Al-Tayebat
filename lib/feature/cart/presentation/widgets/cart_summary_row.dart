import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;
  const SummaryRow({super.key, 
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: isTotal ? Colors.white : Colors.white54,
            fontFamily: 'Cairo',
            fontSize: isTotal ? 16 : 13,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isTotal ? const Color(0xFFE07B2A) : Colors.white70,
            fontFamily: 'Cairo',
            fontSize: isTotal ? 18 : 13,
            fontWeight: isTotal ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}