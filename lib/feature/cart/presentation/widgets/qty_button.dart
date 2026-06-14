import 'package:flutter/material.dart';

class QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const QtyButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFFE07B2A), size: 18),
      ),
    );
  }
}