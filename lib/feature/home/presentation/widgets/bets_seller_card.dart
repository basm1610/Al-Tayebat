import 'package:apppp/feature/all_menu/data/models/menu_item_model.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_event.dart';
import 'package:apppp/feature/foodDetails/presentation/pages/FoodDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerCard extends StatefulWidget {
  final MenuItemModel item;
  const BestSellerCard({super.key, required this.item});

  @override
  State<BestSellerCard> createState() => _BestSellerCardState();
}

class _BestSellerCardState extends State<BestSellerCard> {
  int _selectedSizeIndex = 0;

  static const Map<int, String> _itemImages = {
    1: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=300',
    2: 'https://images.unsplash.com/photo-1553979459-d2229ba7433b?w=300',
    3: 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=300',
    4: 'https://images.unsplash.com/photo-1562967914-608f82629710?w=300',
    5: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=300',
    6: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=300',
    7: 'https://images.unsplash.com/photo-1574653853027-5382a3d23a15?w=300',
    8: 'https://images.unsplash.com/photo-1544025162-d76694265947?w=300',
    9: 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=300',
  };

  String get _imageUrl {
    final catId = widget.item.id ~/ 100;
    return _itemImages[catId] ?? _itemImages[1]!;
  }

  @override
  Widget build(BuildContext context) {
    final selectedSize = widget.item.sizes[_selectedSizeIndex];

    return GestureDetector(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FoodDetailScreen(item: widget.item),
        ),
        );
      }, 
      // 
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                _imageUrl,
                width: 82,
                height: 82,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 82,
                  height: 82,
                  color: const Color(0xFF2A2A2A),
                  child: const Icon(Icons.fastfood,
                      color: Color(0xFFE07B2A), size: 32),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.item.name,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Size chips (compact)
                  if (!widget.item.hasSingleSize)
                    SizedBox(
                      height: 26,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        itemCount: widget.item.sizes.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 6),
                        itemBuilder: (context, i) {
                          final isSelected = _selectedSizeIndex == i;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedSizeIndex = i),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFE07B2A)
                                    : const Color(0xFF2A2A2A),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                widget.item.sizes[i].name,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white54,
                                  fontSize: 10,
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

                  const SizedBox(height: 6),
                  Text(
                    '${selectedSize.price} ج.م',
                    style: const TextStyle(
                      color: Color(0xFFE07B2A),
                      fontFamily: 'Cairo',
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),

            // Add button
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
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
                child: const Icon(Icons.add, color: Colors.white, size: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}