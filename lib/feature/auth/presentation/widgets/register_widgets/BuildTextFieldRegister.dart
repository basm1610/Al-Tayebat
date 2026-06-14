import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildTextFieldRegister extends StatelessWidget {
  String lable;
  TextEditingController controller;
  String hint;
  IconData icon;
  TextInputType keyboardType;
  bool isLtr;

  BuildTextFieldRegister({
    required this.lable,
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.isLtr = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          lable,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: AppColor.kInputBg.withOpacity(0.75),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.30),
                fontSize: 14,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(0.35),
                size: 20,
              ),
            ),
            cursorColor: AppColor.kOrange,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
