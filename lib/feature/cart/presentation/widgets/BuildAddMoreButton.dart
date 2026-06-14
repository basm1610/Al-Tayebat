import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildAddMoreButton extends StatelessWidget {
  const BuildAddMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_circle_outline_rounded,
            color: AppColor.kOrange,
            size: 20,
          ),
          const SizedBox(width: 8),
          const Text(
            'إضافة المزيد من الأصناف',
            style: TextStyle(
              color: AppColor.kOrange,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}