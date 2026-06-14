import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildInputTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  IconData icon;
  TextInputType keyboardType;

   BuildInputTextField({
     required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.kInputBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          hintText: hint,
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.35),
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(0.3),
            size: 20,
          ),
        ),
        cursorColor: AppColor.kOrange,
      ),
    );
  }
}