import 'package:flutter/material.dart';

class BuildSection extends StatelessWidget {
  final String title;
  final Widget child;
  const BuildSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
