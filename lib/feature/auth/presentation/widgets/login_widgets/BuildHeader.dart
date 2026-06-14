import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App Title
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFFF8C00), Color(0xFFFF4500)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'الطيبات',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 1.2,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'تجربة فاخرة في كل لقمة',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFD0D0D0),
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}