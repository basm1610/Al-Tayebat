import 'package:apppp/feature/all_menu/data/models/item_size_model.dart';
import 'package:apppp/feature/all_menu/data/models/menu_item_model.dart';

class CartItemModel {
  final MenuItemModel item;
  final ItemSizeModel selectedSize;
  final int quantity;
 
  const CartItemModel({
    required this.item,
    required this.selectedSize,
    this.quantity = 1,
  });
 
  String get uniqueKey => '${item.id}_${selectedSize.name}';
 
  int get totalPrice => selectedSize.price * quantity;
 
  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(
      item: item,
      selectedSize: selectedSize,
      quantity: quantity ?? this.quantity,
    );
  }
}