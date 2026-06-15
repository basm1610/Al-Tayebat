import 'package:apppp/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_event.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Text(
              'السلة',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state.isEmpty) return const SizedBox.shrink();
                  return TextButton(
                    onPressed: () =>
                        context.read<CartBloc>().add(ClearCartEvent()),
                    child: const Text(
                      'مسح الكل',
                      style: TextStyle(
                        color: Color(0xFFE07B2A),
                        fontFamily: 'Cairo',
                        fontSize: 13,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//     AppBar(
//       backgroundColor: const Color(0xFF121212),
//       elevation: 0,
//       // leading: IconButton(
//       //   icon: const Icon(
//       //     Icons.arrow_back_ios_new,
//       //     color: Colors.white,
//       //     size: 20,
//       //   ),
//       //   onPressed: () => Navigator.maybePop(context),
//       // ),
//       title: const Text(
//         'السلة',
//         style: TextStyle(
//           color: Colors.white,
//           fontFamily: 'Cairo',
//           fontWeight: FontWeight.w700,
//           fontSize: 18,
//         ),
//       ),
//       centerTitle: true,
//       actions: [
//         BlocBuilder<CartBloc, CartState>(
//           builder: (context, state) {
//             if (state.isEmpty) return const SizedBox.shrink();
//             return TextButton(
//               onPressed: () => context.read<CartBloc>().add(ClearCartEvent()),
//               child: const Text(
//                 'مسح الكل',
//                 style: TextStyle(
//                   color: Color(0xFFE07B2A),
//                   fontFamily: 'Cairo',
//                   fontSize: 13,
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
