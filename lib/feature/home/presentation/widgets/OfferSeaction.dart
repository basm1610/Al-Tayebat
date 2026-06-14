import 'package:apppp/feature/all_menu/data/models/menu_category_model.dart';
import 'package:apppp/feature/all_menu/presentation/pages/menu_screen.dart';
import 'package:apppp/feature/home/data/models/offer_config_model.dart';
import 'package:apppp/feature/home/presentation/widgets/BuildSeactionHeader.dart';
import 'package:apppp/feature/home/presentation/widgets/offer_card.dart';
import 'package:flutter/material.dart';

class FeaturedOffersSection extends StatelessWidget {
  final List<MenuCategoryModel> categories;
  const FeaturedOffersSection({super.key, required this.categories});

  // بنات العروض المميزة — كل واحدة بتشير لكاتيجوري معينة
  static const List<OfferConfigModel> _offers = [
    OfferConfigModel(
      categoryId: 1,
      title: 'سندوتشات الدجاج',
      subtitle: 'أشهى التشيكن بأحجام مختلفة',
      badge: 'الأكثر طلباً',
      imageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600',
    ),
    OfferConfigModel(
      categoryId: 3,
      title: 'البرجر',
      subtitle: 'برجر الطيبات بتشيز خاص',
      badge: '٢٠٪ خصم',
      imageUrl:
          'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=600',
    ),
    OfferConfigModel(
      categoryId: 7,
      title: 'الوجبات العائلية',
      subtitle: 'وجبات مجمعة للعيلة كلها',
      badge: 'عرض خاص',
      imageUrl:
          'https://images.unsplash.com/photo-1574653853027-5382a3d23a15?w=600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'العروض المميزة',
          // actionLabel: 'عرض الكل',
          // onAction: () => Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (_) => const MenuScreen()),
          // ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 165,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 16, left: 16),
            itemCount: _offers.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final offer = _offers[index];
              categories.indexWhere((c) => c.id == offer.categoryId);
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MenuScreen()),
                ),
                child: OfferCard(offer: offer),
              );
            },
          ),
        ),
      ],
    );
  }
}
