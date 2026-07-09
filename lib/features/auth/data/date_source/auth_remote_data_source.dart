import 'package:nti_ecommerce_team4/features/auth/data/models/login_response_model.dart';
import 'package:nti_ecommerce_team4/features/auth/data/models/message_response_model.dart';

import '../../../../core/network/dio_helper.dart';

class AuthRemoteDataSource {
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await DioHelper.post(
      url: "auth/login",
      data: {"email": email, "password": password},
    );

    return LoginResponseModel.fromJson(response.data);
  }

  Future<MessageResponseModel> register({
    required Map<String, dynamic> data,
  }) async {
    final response = await DioHelper.post(url: "/Auth/register", data: data);

    return MessageResponseModel(message: response.data["message"]);
  }

  Future<MessageResponseModel> verifyEmail({required String otp}) async {
    final response = await DioHelper.post(
      url: "/Auth/verify-email",
      data: {"otp": otp},
    );

    return MessageResponseModel(message: response.data);
  }

  Future<MessageResponseModel> forgotPassword({required String email}) async {
    final response = await DioHelper.post(
      url: "/Auth/forgot-password",
      data: {"email": email},
    );

    return MessageResponseModel(message: response.data["message"]);
  }

  Future<MessageResponseModel> validateOtp({required String otp}) async {
    final response = await DioHelper.post(
      url: "/Auth/validate-otp",
      data: {"otp": otp},
    );

    return MessageResponseModel(message: response.data);
  }

  Future<MessageResponseModel> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    final response = await DioHelper.post(
      url: "/Auth/reset-password",
      data: {"email": email, "otp": otp, "newPassword": newPassword},
    );

    return MessageResponseModel.fromJson(response.data);
  }
}
