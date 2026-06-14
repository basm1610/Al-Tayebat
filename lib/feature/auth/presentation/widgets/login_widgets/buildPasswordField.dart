import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildPasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final String lable;
  const BuildPasswordField({
    required this.passwordController,
    required this.lable,
    super.key,
  });

  @override
  State<BuildPasswordField> createState() => _BuildPasswordFieldState();
}

class _BuildPasswordFieldState extends State<BuildPasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          widget.lable,
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
            // color: AppColor.kInputBg,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: TextField(
            controller: widget.passwordController,
            obscureText: _obscurePassword,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: '••••••••',
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.30),
                fontSize: 14,
                letterSpacing: 3,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              prefixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.white.withOpacity(0.45),
                  size: 20,
                ),
              ),
              suffixIcon: Icon(
                Icons.lock_outline_rounded,
                color: Colors.white.withOpacity(0.35),
                size: 20,
              ),
            ),
            cursorColor: AppColor.kOrange,
          ),
        ),
      ],
    );
  }
}
