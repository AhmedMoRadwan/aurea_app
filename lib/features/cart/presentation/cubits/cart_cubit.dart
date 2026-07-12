import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/date_source/cart_remote_data_source.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRemoteDataSource cartRemoteDataSource;

  CartCubit(this.cartRemoteDataSource) : super(CartInitial());

  Future<void> addToCart(String productId, int quantity) async {
    emit(AddToCartLoading());
    try {
      final response = await cartRemoteDataSource.addToCart(productId: productId, quantity: quantity);
      
      String successMsg = "Product added successfully";
      if (response != null && response is Map && response.containsKey('message')) {
        successMsg = response['message'];
      }
      
      emit(AddToCartSuccess(message: successMsg));
    } catch (e) {
      emit(CartError(errorMessage: "Failed to add product: ${e.toString()}"));
    }
  }
}
