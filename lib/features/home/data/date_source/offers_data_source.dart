import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nti_ecommerce_team4/core/network/token_manager.dart';
import 'package:nti_ecommerce_team4/features/home/data/models/offers_model.dart';

class OffersDataSource {
  final Dio dio = Dio();

  Future<List<OffersModel>> getOffer() async {

     try {

      final token = await TokenManager.getToken();
      final response = await dio.get(
        "https://accessories-eshop.runasp.net/api/offers",
         options: Options(
        headers: {
          "Authorization": "Bearer $token"
        }
      )
      );

      final List data = response.data["offers"]["items"];
      log("${data.length}");

      return data
          .map((e) => OffersModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      log("Status Code: ${e.response?.statusCode}");
      log("Response: ${e.response?.data}");
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  }
