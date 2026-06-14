

import 'package:apppp/feature/cart/data/models/cart-item-model.dart';

class CartState {
  final List<CartItemModel> items;

  const CartState({this.items = const []});

  int get totalItems => items.fold(0, (sum, i) => sum + i.quantity);
  int get totalPrice => items.fold(0, (sum, i) => sum + i.totalPrice);
  bool get isEmpty => items.isEmpty;

  CartState copyWith({List<CartItemModel>? items}) {
    return CartState(items: items ?? this.items);
  }
}