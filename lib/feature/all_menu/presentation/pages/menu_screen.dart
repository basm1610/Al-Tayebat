import 'package:apppp/feature/all_menu/data/repositories/menu_repository.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_events.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_menu.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_states.dart';
import 'package:apppp/feature/all_menu/presentation/widgets/CategoryTabBar.dart';
import 'package:apppp/feature/all_menu/presentation/widgets/MenuItemCard.dart';
import 'package:apppp/feature/cart/presentation/widgets/BuildTopBarCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: BlocProvider(
        create: (_) =>
            MenuBloc(repository: MenuRepository())..add(LoadMenuEvent()),
        child: MenuView(),
      ),
    );
  }
}

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BlocBuilder<MenuBloc,MenuState>(
        builder: (context,state){
           // ── Loading ──
          if (state is MenuLoading || state is MenuInitial) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFE07B2A)),
            );
          }
           // ── Error ──
          if (state is MenuError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Color(0xFFE07B2A), size: 48),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white54, fontFamily: 'Cairo'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE07B2A)),
                    onPressed: () => context.read<MenuBloc>().add(LoadMenuEvent()),
                    child: const Text('إعادة المحاولة',
                        style: TextStyle(fontFamily: 'Cairo', color: Colors.white)),
                  ),
                ],
              ),
            );
          }
          if (state is MenuLoaded) {
            return  SafeArea(
            child: Column(
              children: [
                BuildTopBarCart(context: context, text: 'الطيبات'),
      
                // ── FEATURE: Category Tab Bar ──
                Expanded(
                  child: Column(
                    children: [
                      CategoryTabBar(
                        categories: state.categories.map((e)=>e.name).toList(),
                        selectedIndex:state.selectedCategoryIndex,
                        onCategorySelected: (index) =>
                            context.read<MenuBloc>().add(SelectCategoryEvent(index)),
                      ),
                      const SizedBox(height: 4),
                      // ── FEATURE: Menu Items List ──
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: ListView.builder(
                            key: ValueKey(state.selectedCategoryIndex),
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            itemCount: state.selectedCategory.items.length,
                            itemBuilder: (context, index) =>
                                MenuItemCard(item: state.selectedCategory.items[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          }
                    return const SizedBox.shrink();

        }
        ),
    );
  }
}