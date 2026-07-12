import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_ecommerce_team4/core/network/token_manager.dart';
import 'package:nti_ecommerce_team4/features/categories/data/models/categories_model.dart'; 

class CategoriesDataSource {
   final Dio dio = Dio();

Future<List<CategoriesModel>> getCategories() async {
 
  try {

    final token = await TokenManager.getToken();
    // log("token is : $token");
    final response = await dio.get(
      "https://accessories-eshop.runasp.net/api/categories",
      options: Options(
        headers: {
          "Authorization": "Bearer $token"
        }
      )
    );

    final List data =response.data["categories"];

    return data
        .map((e) => CategoriesModel.fromJson(e))
        .toList();
  } catch (e) {
    log(e.toString());
    rethrow;
  }
}}