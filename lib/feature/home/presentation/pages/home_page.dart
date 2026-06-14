
import 'package:apppp/feature/all_menu/data/models/menu_category_model.dart';
import 'package:apppp/feature/all_menu/data/models/menu_item_model.dart';
import 'package:apppp/feature/all_menu/data/repositories/menu_repository.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_events.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_menu.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_states.dart';
import 'package:apppp/feature/home/presentation/widgets/BuildHeroHeader.dart';
import 'package:apppp/feature/home/presentation/widgets/BuildSearchBar.dart';
import 'package:apppp/feature/home/presentation/widgets/BuildTopAppBarHomeScreen.dart';
import 'package:apppp/feature/home/presentation/widgets/OfferSeaction.dart';
import 'package:apppp/feature/home/presentation/widgets/best_seller_section.dart';
import 'package:apppp/feature/home/presentation/widgets/category_chips_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


const List<int> kBestSellerIds = [101, 302, 401, 503, 601, 108, 205];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenuBloc(repository: MenuRepository())..add(LoadMenuEvent()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: const HomeAppBar(),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is MenuLoading || state is MenuInitial) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFE07B2A)),
            );
          }
          if (state is MenuError) {
            return Center(
              child: Text(state.message,
                  style: const TextStyle(color: Colors.white54, fontFamily: 'Cairo')),
            );
          }
          if (state is MenuLoaded) {
            // استخرج الأكثر مبيعاً
            final bestSellers = _extractBestSellers(state.categories);

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const HeroHeader(),
                  const SearchBarWidget(),
                  const SizedBox(height: 8),

                  // ── Featured Offers ──
                  FeaturedOffersSection(categories: state.categories),
                  const SizedBox(height: 24),

                  // ── Category Quick Access ──
                  CategoryChipsRow(categories: state.categories),
                  const SizedBox(height: 24),

                  // ── الأكثر مبيعاً ──
                  if (bestSellers.isNotEmpty) ...[
                    BestSellersSection(items: bestSellers),
                    const SizedBox(height: 28),
                  ],
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  /// يستخرج المنتجات بناءً على kBestSellerIds من كل الكاتيجوريز
  List<MenuItemModel> _extractBestSellers(List<MenuCategoryModel> categories) {
    final allItems = categories.expand((c) => c.items).toList();
    final result = <MenuItemModel>[];
    for (final id in kBestSellerIds) {
      final found = allItems.where((item) => item.id == id);
      if (found.isNotEmpty) result.add(found.first);
    }
    return result;
  }
}

