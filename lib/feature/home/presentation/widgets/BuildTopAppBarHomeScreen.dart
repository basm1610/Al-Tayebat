import 'package:apppp/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_state.dart';
import 'package:apppp/feature/cart/presentation/pages/cartPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF121212),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: Image.asset("assets/images/logo.png"),
      title: const Text(
        'الطيبات',
        style: TextStyle(
          color: Color(0xFFE07B2A),
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      actions: [
        // زر السلة مع badge
        BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            return Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  ),
                ),
                if (cartState.totalItems > 0)
                  Positioned(
                    top: 8,
                    right: 6,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE07B2A),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${cartState.totalItems}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
