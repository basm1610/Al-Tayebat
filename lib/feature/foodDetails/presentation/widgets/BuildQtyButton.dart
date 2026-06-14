import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildQtyButton extends StatelessWidget {
  final IconData? icon;
  final void Function()? onTap;
  const BuildQtyButton({
    super.key,
    this.icon, this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColor.kOrange,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}