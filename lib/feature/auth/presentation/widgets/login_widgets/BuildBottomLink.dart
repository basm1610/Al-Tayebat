import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildBottomLink extends StatelessWidget {
  final String text;
  final String textWithColor;
  final void Function()? onTap;
  const BuildBottomLink({
    super.key,
    required this.text,
    required this.textWithColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Text(
              textWithColor,
              style: TextStyle(
                color: AppColor.kOrange,
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14.5,
            ),
          ),
        ],
      ),
    );
  }
}
