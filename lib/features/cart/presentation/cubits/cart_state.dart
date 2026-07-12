import 'package:nti_ecommerce_team4/features/cart/data/models/cart_item_model.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final List<CartItemModel> items;

  CartSuccessState(this.items);
}

class CartErrorState extends CartState {
  final String errorMessage;

  CartErrorState({required this.errorMessage});
}
