import 'package:apppp/feature/all_menu/presentation/bloc/bloc_events.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_menu.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_states.dart';
import 'package:apppp/feature/all_menu/presentation/pages/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreenWithCategory extends StatelessWidget {
  final int initialCategoryIndex;
  const MenuScreenWithCategory({super.key, required this.initialCategoryIndex});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state is MenuLoaded && state.selectedCategoryIndex != initialCategoryIndex) {
          context.read<MenuBloc>().add(SelectCategoryEvent(initialCategoryIndex));
        }
      },
      child: const MenuScreen(),
    );
  }
}