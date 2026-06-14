import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildAppleButton.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildGoogleButton.dart';
import 'package:flutter/material.dart';

class BuildSocialButtons extends StatelessWidget {
  final IconData? icon;
  bool isApple;
  bool isGoogle;
  Color? color;
  final VoidCallback onTap;
  BuildSocialButtons({
    this.icon,
    this.isApple = false,
    this.isGoogle = false,
    this.color = Colors.white,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.10),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        child: icon != null
            ? Icon(icon, color: color, size: 25)
            : isApple
            ? const Icon(Icons.apple, color: Colors.white, size: 26)
            : const Center(child: BuildGoogleButton()),
      ),
    );
  }
}
