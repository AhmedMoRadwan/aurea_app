import 'dart:developer';

import '../../../../core/network/dio_helper.dart';

class CartRemoteDataSource {
  Future<dynamic> addToCart({required String productId, int quantity = 1}) async {
    try {
      final response = await DioHelper.post(
        url: "cart/items",
        data: {
          "productId": productId,
          "quantity": quantity,
        },
      );
      return response.data;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
