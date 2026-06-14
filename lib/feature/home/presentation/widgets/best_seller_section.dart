import 'package:apppp/feature/all_menu/data/models/menu_item_model.dart';
import 'package:apppp/feature/all_menu/presentation/pages/menu_screen.dart';
import 'package:apppp/feature/home/presentation/widgets/BuildSeactionHeader.dart';
import 'package:apppp/feature/home/presentation/widgets/bets_seller_card.dart';
import 'package:flutter/material.dart';

class BestSellersSection extends StatelessWidget {
  final List<MenuItemModel> items;
  const BestSellersSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SectionHeader(
          title: 'الأكثر مبيعاً',
          actionLabel: 'عرض الكل',
          onAction: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MenuScreen()),
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) =>
              BestSellerCard(item: items[index]),
        ),
      ],
    );
  }
}