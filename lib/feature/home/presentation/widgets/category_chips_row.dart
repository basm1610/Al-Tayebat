import 'package:apppp/feature/all_menu/data/models/menu_category_model.dart';
import 'package:apppp/feature/all_menu/data/repositories/menu_repository.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_events.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_menu.dart';
import 'package:apppp/feature/home/presentation/widgets/menu_screen_withCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryChipsRow extends StatelessWidget {
  final List<MenuCategoryModel> categories;
  const CategoryChipsRow({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return GestureDetector(
            onTap: () {
              // تفتح MenuScreen مع الكاتيجوري المحددة
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => MenuBloc(repository: MenuRepository())
                      ..add(LoadMenuEvent()),
                    child: MenuScreenWithCategory(initialCategoryIndex: index),
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                cat.name,
                style: const TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Cairo',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}