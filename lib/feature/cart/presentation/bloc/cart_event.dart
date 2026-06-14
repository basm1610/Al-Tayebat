

import 'package:apppp/feature/all_menu/data/models/item_size_model.dart';
import 'package:apppp/feature/all_menu/data/models/menu_item_model.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final MenuItemModel item;
  final ItemSizeModel size;
  AddToCartEvent({required this.item, required this.size});
}

class RemoveFromCartEvent extends CartEvent {
  final String uniqueKey;
  RemoveFromCartEvent(this.uniqueKey);
}

class IncrementQuantityEvent extends CartEvent {
  final String uniqueKey;
  IncrementQuantityEvent(this.uniqueKey);
}

class DecrementQuantityEvent extends CartEvent {
  final String uniqueKey;
  DecrementQuantityEvent(this.uniqueKey);
}

class ClearCartEvent extends CartEvent {}