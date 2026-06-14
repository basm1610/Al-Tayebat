// import 'dart:developer';

// import 'package:apppp/core/constant/app_color.dart';
// import 'package:apppp/feature/foodDetails/presentation/widgets/BuildBottomBarFoodDetails.dart';
// import 'package:apppp/feature/foodDetails/presentation/widgets/BuildExtra.dart';
// import 'package:apppp/feature/foodDetails/presentation/widgets/BuildHeroImage.dart';
// import 'package:apppp/feature/foodDetails/presentation/widgets/BuildIngredients.dart';
// import 'package:apppp/feature/foodDetails/presentation/widgets/BuildQtyRow.dart';
// import 'package:apppp/feature/foodDetails/presentation/widgets/BuildSection.dart';
// import 'package:apppp/feature/foodDetails/presentation/widgets/BuildSpicePicker.dart';
// import 'package:apppp/feature/foodDetails/presentation/widgets/BuildTopButtonBar.dart';
// import 'package:flutter/material.dart';

// class FoodDetailsScreen extends StatefulWidget {
//   const FoodDetailsScreen({super.key});
//   @override
//   State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
// }

// class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
//   int extrasPrice = 0;
//   int _qty = 1;
//   final double _basePrice = 130;



//   double get _total {

//     // log("_basePrice :$_basePrice");
//     // log("extrasPrice :$extrasPrice");
//     // log("_qty :$_qty");
//      return  extrasPrice+( _basePrice * _qty);
//   }

  
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF111111),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               BuildHeroImage(),
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       BuildSection(
//                         title: 'المكونات',
//                         child: BuildIngredients(),
//                       ),
//                       const SizedBox(height: 24),
//                       BuildSection(
//                         title: 'مستوى الحار',
//                         child: BuildSpicePicker(),
//                       ),
//                       const SizedBox(height: 24),
//                       BuildSection(
//                         title: 'إضافات',
//                         child: BuildExtra(
//                           onTotalChanged: (value) {
//                             setState(() {
//                               extrasPrice = value;
//                             });
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       BuildSection(
//                         title: 'الكمية',
//                         child: BuildQtyRow(
//                           qty: _qty,
//                           onDecrement: () {
//                             if (_qty > 1) {
//                               setState(() {
//                                 _qty--;
//                               });
//                             }
//                           },
//                           onIncrement: () {
//                             setState(() {
//                               _qty++;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Floating top buttons
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   BuildTopButtonBar(
//                     icon: Icons.arrow_forward_rounded,
//                     onTap: () => Navigator.maybePop(context),
//                   ),
//                   BuildTopButtonBar(icon: Icons.share_rounded, onTap: () {}),
//                 ],
//               ),
//             ),
//           ),
//           // Bottom bar
//           Positioned(bottom: 0, left: 0, right: 0, child: BuildBottomBarFoodDetails(total: _total,)),
//         ],
//       ),
//     );
//   }

//   }

// lib/features/menu/presentation/screens/food_detail_screen.dart

import 'package:apppp/feature/all_menu/data/models/item_size_model.dart';
import 'package:apppp/feature/all_menu/data/models/menu_item_model.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FoodDetailScreen extends StatefulWidget {
  final MenuItemModel item;

  const FoodDetailScreen({super.key, required this.item});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _selectedSizeIndex = 0;
  int _quantity = 1;

  ItemSizeModel get _selectedSize => widget.item.sizes[_selectedSizeIndex];
  int get _totalPrice => _selectedSize.price * _quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          // ── Hero Image ──
          SizedBox(
            height: 320,
            width: double.infinity,
            child: Image.network(
              _getCategoryImage(widget.item),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFF2A1A0A),
                child: const Center(
                  child: Icon(Icons.fastfood, color: Color(0xFFE07B2A), size: 64),
                ),
              ),
            ),
          ),

          // ── Gradient overlay on image ──
          Container(
            height: 320,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),

          // ── Back button ──
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            right: 16,
            child: GestureDetector(
              onTap: () => Navigator.maybePop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
              ),
            ),
          ),

          // ── Bottom Sheet Content ──
          DraggableScrollableSheet(
            initialChildSize: 0.62,
            minChildSize: 0.62,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
                  children: [
                    // Handle
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ── Name + Price ──
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.item.name,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Cairo',
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              height: 1.3,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${_selectedSize.price} ج.م',
                          style: const TextStyle(
                            color: Color(0xFFE07B2A),
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Size Selector ──
                    if (!widget.item.hasSingleSize) ...[
                      const Text(
                        'اختر الحجم',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: List.generate(widget.item.sizes.length, (index) {
                          final size = widget.item.sizes[index];
                          final isSelected = _selectedSizeIndex == index;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedSizeIndex = index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFE07B2A).withOpacity(0.12)
                                    : const Color(0xFF252525),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFFE07B2A)
                                      : Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 180),
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isSelected
                                                ? const Color(0xFFE07B2A)
                                                : Colors.white30,
                                            width: 2,
                                          ),
                                          color: isSelected
                                              ? const Color(0xFFE07B2A)
                                              : Colors.transparent,
                                        ),
                                        child: isSelected
                                            ? const Icon(Icons.check,
                                                color: Colors.white, size: 12)
                                            : null,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        size.name,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.white60,
                                          fontFamily: 'Cairo',
                                          fontSize: 14,
                                          fontWeight: isSelected
                                              ? FontWeight.w700
                                              : FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${size.price} ج.م',
                                    style: TextStyle(
                                      color: isSelected
                                          ? const Color(0xFFE07B2A)
                                          : Colors.white38,
                                      fontFamily: 'Cairo',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 8),
                    ],

                    // ── Quantity ──
                    const SizedBox(height: 8),
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'الكمية',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cairo',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            _RoundedButton(
                              icon: Icons.add,
                              onTap: () => setState(() => _quantity++),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                '$_quantity',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            _RoundedButton(
                              icon: Icons.remove,
                              onTap: () {
                                if (_quantity > 1) setState(() => _quantity--);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // ── Add to Cart Button ──
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          for (int i = 0; i < _quantity; i++) {
                            context.read<CartBloc>().add(
                                  AddToCartEvent(
                                    item: widget.item,
                                    size: _selectedSize,
                                  ),
                                );
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'تم إضافة ${widget.item.name} للسلة ✓',
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(fontFamily: 'Cairo'),
                              ),
                              backgroundColor: const Color(0xFFE07B2A),
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          );
                          Navigator.maybePop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE07B2A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$_totalPrice ج.م',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              'إضافة للسلة',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            const Icon(Icons.shopping_cart_outlined,
                                color: Colors.white, size: 22),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// صورة placeholder بناءً على category ID
  String _getCategoryImage(MenuItemModel item) {
    const images = {
      1: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800',
      2: 'https://images.unsplash.com/photo-1553979459-d2229ba7433b?w=800',
      3: 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=800',
      4: 'https://images.unsplash.com/photo-1562967914-608f82629710?w=800',
      5: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=800',
      6: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800',
      7: 'https://images.unsplash.com/photo-1574653853027-5382a3d23a15?w=800',
      8: 'https://images.unsplash.com/photo-1544025162-d76694265947?w=800',
      9: 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=800',
    };
    final catId = (item.id ~/ 100); // 101→1, 201→2, etc.
    return images[catId] ?? images[1]!;
  }
}

class _RoundedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _RoundedButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFFE07B2A), size: 20),
      ),
    );
  }
}
