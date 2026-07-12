import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_ecommerce_team4/core/network/token_manager.dart';
import 'package:nti_ecommerce_team4/features/home/data/models/products_model.dart';

class ProductsDataSource {
   final Dio dio = Dio();

Future<List<ProductsModel>> getProducts() async {
 
  try {

    final token = await TokenManager.getToken();
    final response = await dio.get(
      "https://accessories-eshop.runasp.net/api/products",
       options: Options(
        headers: {
          "Authorization": "Bearer $token"
        }
      )
     
    );

    final List data =response.data["items"];

    return data
        .map((e) => ProductsModel.fromJson(e))
        .toList();
  } catch (e) {
    if (e is DioException) {
    log("Status Code: ${e.response?.statusCode}");
    log("Response: ${e.response?.data}");
  }
  else {log("$e");}
    rethrow;
  }
}}