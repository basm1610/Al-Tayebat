import 'package:apppp/feature/contact/presentation/widgets/BuildContactInfoCard.dart';
import 'package:flutter/material.dart';

class BuildPhoneCard extends StatelessWidget {
  const BuildPhoneCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContactInfoCard(
      label: 'رقم الهاتف',
      content: '16053',
      icon: Icons.phone_outlined,
      iconColor: const Color(0xFFE07B2A),
      contentStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
      ),
    );
  }
}
