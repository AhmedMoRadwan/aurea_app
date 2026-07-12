import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/features/cart/data/date_source/cart_get_data.dart';
import 'package:nti_ecommerce_team4/features/cart/data/models/cart_item_model.dart';
import 'package:nti_ecommerce_team4/features/cart/presentation/cubits/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRemoteDataSource _dataSource = CartRemoteDataSource();
  List<CartItemModel> _cartItems = [];

  CartCubit() : super(CartInitialState());

  Future<void> getCart() async {
    emit(CartLoadingState());
    try {
      _cartItems = await _dataSource.getCart();
      emit(CartSuccessState(List.from(_cartItems)));
    } catch (e) {
      emit(CartErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> deleteCartItem(String id) async {
    emit(CartLoadingState());
    try {
      await _dataSource.deleteCartItem(id);
      _cartItems.removeWhere((item) => item.id == id);
      emit(CartSuccessState(List.from(_cartItems)));
    } catch (e) {
      emit(CartErrorState(errorMessage: e.toString()));
      // Fallback: Re-emit last known success state with remaining items
      emit(CartSuccessState(List.from(_cartItems)));
    }
  }
}
