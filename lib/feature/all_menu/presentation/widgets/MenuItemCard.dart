import 'package:apppp/feature/all_menu/data/models/menu_item_model.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemCard extends StatefulWidget {
  final MenuItemModel item;

  const MenuItemCard({super.key, required this.item});

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedSize = widget.item.sizes[_selectedSizeIndex];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image with rating
          Stack(
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600",
                height: 190,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 190,
                  color: const Color(0xFF2A2A2A),
                  child: const Icon(
                    Icons.fastfood,
                    color: Color(0xFFE07B2A),
                    size: 48,
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFE07B2A),
                        size: 13,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "4.8",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.item.name,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Text(
                      '${selectedSize.price} ج.م',
                      style: const TextStyle(
                        color: Color(0xFFE07B2A),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  "صدر دجاج مقرمش مع جبنة شيدر سائلة، خس طازج وصوص الطيبات الخاص.",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.55),
                    fontSize: 12,
                    fontFamily: 'Cairo',
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                // Row(
                //   textDirection: TextDirection.rtl,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     GestureDetector(
                //       onTap: () {},
                //       child: Container(
                //         width: 38,
                //         height: 38,
                //         decoration: BoxDecoration(
                //           color: const Color(0xFFE07B2A),
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child: const Icon(
                //           Icons.add,
                //           color: Colors.white,
                //           size: 22,
                //         ),
                //       ),
                //     ),
                //     Row(
                //       textDirection: TextDirection.rtl,
                //       children: [
                //         Icon(
                //           Icons.access_time,
                //           color: Colors.white.withOpacity(0.4),
                //           size: 13,
                //         ),
                //         const SizedBox(width: 5),
                //       ],
                //     ),
                //   ],
                // ),
                // ── اختيار الحجم (يظهر فقط لو في أكثر من حجم واحد) ──
                if (!widget.item.hasSingleSize) ...[
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 34,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      reverse: true, // RTL order
                      itemCount: widget.item.sizes.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final size = widget.item.sizes[index];
                        final isSelected = _selectedSizeIndex == index;
                        return GestureDetector(
                          onTap: () =>
                              setState(() => _selectedSizeIndex = index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFE07B2A)
                                  : const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(20),
                              border: isSelected
                                  ? null
                                  : Border.all(
                                      color: Colors.white.withOpacity(0.1),
                                      width: 1,
                                    ),
                            ),
                            child: Text(
                              size.name,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.white60,
                                fontSize: 12,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
                const SizedBox(height: 12),

                // ── زر الإضافة ──
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // السعر المحدد مع الحجم
                    Text(
                      widget.item.hasSingleSize
                          ? widget.item.sizes.first.name
                          : '${selectedSize.name} • ${selectedSize.price} ج.م',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.35),
                        fontSize: 11,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: dispatch AddToCartEvent
                       context.read<CartBloc>().add(AddToCartEvent(
                      item: widget.item,
                      size: selectedSize,
                    ));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'تم إضافة ${widget.item.name} ✓',
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(fontFamily: 'Cairo'),
                    ),
                    backgroundColor: const Color(0xFFE07B2A),
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE07B2A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
