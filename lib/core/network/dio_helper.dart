import 'package:dio/dio.dart';
import 'package:nti_ecommerce_team4/core/error/api_error_model.dart';

import 'api_constants.dart';
import 'token_manager.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,

        connectTimeout: const Duration(seconds: 30),

        receiveTimeout: const Duration(seconds: 30),

        sendTimeout: const Duration(seconds: 30),

        receiveDataWhenStatusError: true,

        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenManager.getToken();

          if (token != null) {
            options.headers[ApiConstants.authorization] = "Bearer $token";
          }

          return handler.next(options);
        },

        // onError: (error, handler) async {
        //   if (error.response?.statusCode == 401) {
        //     await TokenManager.removeToken();
        //   }

        //   return handler.next(error);
        // },
        onError: (error, handler) {
          if (error.response?.data != null) {
            final apiError = ApiErrorModel.fromJson(error.response!.data);

            print(apiError.firstErrorMessage);
          }

          return handler.next(error);
        },
      ),
    );
  }

  static Future<Response> post({
    required String url,

    dynamic data,

    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(url, data: data, queryParameters: queryParameters);
  }

  static Future<Response> get({
    required String url,

    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(url, queryParameters: queryParameters);
  }

  static Future<Response> delete({required String url, dynamic data}) async {
    return await dio.delete(url, data: data);
  }
}
