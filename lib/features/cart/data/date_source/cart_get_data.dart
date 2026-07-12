import 'package:dio/dio.dart';
import 'package:nti_ecommerce_team4/features/cart/data/models/cart_item_model.dart';

class CartRemoteDataSource {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://accessories-eshop.runasp.net/api/",
  ));

  Future<List<CartItemModel>> getCart() async {
    final response = await _dio.get("cart");

    final List items = response.data["items"];
    return items.map((item) => CartItemModel.fromJson(item)).toList();
  }

  Future<void> deleteCartItem(String id) async {
    await _dio.delete("cart/$id");
  }
}
