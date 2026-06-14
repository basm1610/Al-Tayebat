import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildTopBarCart extends StatelessWidget {
  final String text;
  const BuildTopBarCart({super.key, required this.context, required this.text});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  Container(
          //     width: 42,
          //     height: 42,
          //     decoration: BoxDecoration(
          //       color: AppColor.kInputBg,
          //       shape: BoxShape.circle,
          //       border: Border.all(color: Colors.white.withOpacity(0.15)),
          //     ),
          //     child: GestureDetector(
          //       onTap: () => Navigator.maybePop(context),
          //       child: Icon(
          //         Icons.arrow_forward_rounded,
          //         color: AppColor.kOrange,
          //         size: 24,
          //       ),
          //     ),
          //   ),
          ShaderMask(
            shaderCallback: (b) => const LinearGradient(
              colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
            ).createShader(b),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
