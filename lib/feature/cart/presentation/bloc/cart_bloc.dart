// lib/features/cart/bloc/cart_bloc.dart

import 'package:apppp/feature/cart/data/models/cart-item-model.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_event.dart';
import 'package:apppp/feature/cart/presentation/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<IncrementQuantityEvent>(_onIncrement);
    on<DecrementQuantityEvent>(_onDecrement);
    on<ClearCartEvent>(_onClear);
  }

  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final items = List<CartItemModel>.from(state.items);
    final key = '${event.item.id}_${event.size.name}';
    final index = items.indexWhere((i) => i.uniqueKey == key);

    if (index >= 0) {
      // المنتج موجود بالفعل → زود الكمية
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
    } else {
      items.add(CartItemModel(item: event.item, selectedSize: event.size));
    }
    emit(state.copyWith(items: items));
  }

  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    final items = state.items.where((i) => i.uniqueKey != event.uniqueKey).toList();
    emit(state.copyWith(items: items));
  }

  void _onIncrement(IncrementQuantityEvent event, Emitter<CartState> emit) {
    final items = List<CartItemModel>.from(state.items);
    final index = items.indexWhere((i) => i.uniqueKey == event.uniqueKey);
    if (index >= 0) {
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
      emit(state.copyWith(items: items));
    }
  }

  void _onDecrement(DecrementQuantityEvent event, Emitter<CartState> emit) {
    final items = List<CartItemModel>.from(state.items);
    final index = items.indexWhere((i) => i.uniqueKey == event.uniqueKey);
    if (index >= 0) {
      if (items[index].quantity <= 1) {
        items.removeAt(index);
      } else {
        items[index] = items[index].copyWith(quantity: items[index].quantity - 1);
      }
      emit(state.copyWith(items: items));
    }
  }

  void _onClear(ClearCartEvent event, Emitter<CartState> emit) {
    emit(const CartState());
  }
}