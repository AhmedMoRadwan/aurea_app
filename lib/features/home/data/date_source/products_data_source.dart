import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_ecommerce_team4/features/home/data/models/products_model.dart';

class ProductsDataSource {
   final Dio dio = Dio();

Future<List<ProductsModel>> getProducts() async {
 
  try {
    final response = await dio.get(
      "https://accessories-eshop.runasp.net/api/products",
      options: Options(
        headers: {
          "Authorization": "Bearer "
        }
      )
    );

    final List data =response.data["items"];

    return data
        .map((e) => ProductsModel.fromJson(e))
        .toList();
  } catch (e) {
    log(e.toString());
    rethrow;
  }
}}