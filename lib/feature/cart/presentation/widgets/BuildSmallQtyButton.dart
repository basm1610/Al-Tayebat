import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildSmallQtyButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  const BuildSmallQtyButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: AppColor.kOrange,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}
