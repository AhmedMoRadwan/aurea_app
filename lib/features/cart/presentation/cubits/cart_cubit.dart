import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/date_source/cart_remote_data_source.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {

  CartCubit(this.cartRemoteDataSource) : super(CartInitial());
  final CartRemoteDataSource cartRemoteDataSource;


  Future<void> addToCart(String productId, int quantity) async {
    emit(CartLoading());
    try {
      final cartResponse = await cartRemoteDataSource.addToCart(productId: productId, quantity: quantity);
      emit(CartSuccess(cartItems: cartResponse.items));
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
    }
  }
}
