import 'dart:developer';
import '../../../../core/network/dio_helper.dart';
import '../models/product_model.dart';
import '../models/review_model.dart';

class ProductDetailsRemoteDataSource {
  // Required task: get product by id
  Future<ProductItem> getProductDetails(String productId) async {
    try {
      String id  ="6f7e046d-94b3-4ba4-9f00-6014e4209014";
      final response = await DioHelper.get(url: "products/$id");
      log("Product details response: ${response.data.toString()}");
      return ProductItem.fromJson(response.data);
    } catch (e) {
      log("Error fetching product details: $e");
      rethrow;
    }
  }

  Future<ReviewResponse> getReviews(String productId) async {
    try {
      String id  ="6f7e046d-94b3-4ba4-9f00-6014e4209014";
      final response = await DioHelper.get(
        url: "reviews/$id",
        //queryParameters: {"page": 1, "pageSize": 10},
      );
      return ReviewResponse.fromJson(response.data);
    } catch (e) {
      log("Error fetching reviews: $e");
      rethrow;
    }
  }
}
