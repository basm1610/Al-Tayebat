import 'package:apppp/feature/contact/presentation/widgets/BuildContactInfoCard.dart';
import 'package:flutter/material.dart';

class BuildAddressCard extends StatelessWidget {
  const BuildAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContactInfoCard(
      label: 'العنوان',
      content: 'المنوفيه، شبين الكوم - امام نادي الغزل',
      icon: Icons.location_on_outlined,
      iconColor: const Color(0xFFE07B2A),
    );
  }
}
