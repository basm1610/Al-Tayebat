import 'package:apppp/feature/auth/presentation/widgets/register_widgets/BuildTopAppBar.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_state.dart';
import 'package:apppp/feature/cart/presentation/widgets/cart_appBar.dart';
import 'package:apppp/feature/cart/presentation/widgets/cart_empty.dart';
import 'package:apppp/feature/cart/presentation/widgets/cart_item_card.dart';
import 'package:apppp/feature/cart/presentation/widgets/cart_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      // appBar: CartAppBar(),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.isEmpty) return const EmptyCartView();
          return Column(
            children: [
              CartAppBar(),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) =>
                      CartItemCard(cartItem: state.items[index]),
                ),
              ),
              CartSummary(state: state),
            ],
          );
        },
      ),
    );
  }
}
