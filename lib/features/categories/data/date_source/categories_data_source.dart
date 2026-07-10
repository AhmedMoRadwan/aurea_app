import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_ecommerce_team4/features/categories/data/models/categories_model.dart'; 

class CategoriesDataSource {
   final Dio dio = Dio();

Future<List<CategoriesModel>> getCategories() async {
 
  try {
    final response = await dio.get(
      "https://accessories-eshop.runasp.net/api/categories",
      options: Options(
        headers: {
          '':'Bearer '
        }
      )
    );

    final List data =response.data[0]["categories"];

    return data
        .map((e) => CategoriesModel.fromJson(e))
        .toList();
  } catch (e) {
    log(e.toString());
    rethrow;
  }
}}