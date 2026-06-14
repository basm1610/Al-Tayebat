// ignore: file_names
import 'package:flutter/material.dart';

class BuildBackground extends StatelessWidget {
  const BuildBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.3, -0.4),
          radius: 1.2,
          colors: [Color(0xFF2D1A00), Color(0xFF150D00), Color(0xFF0A0A0A)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}