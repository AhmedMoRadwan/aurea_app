import 'package:nti_ecommerce_team4/features/auth/data/models/login_response_model.dart';
import 'package:nti_ecommerce_team4/features/auth/data/models/message_response_model.dart';

import '../../../../core/network/dio_helper.dart';

class AuthRemoteDataSource {
  //? login
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

  //? register
  Future<MessageResponseModel> register({
    required Map<String, dynamic> data,
  }) async {
    final response = await DioHelper.post(url: "auth/register", data: data);

    return MessageResponseModel(message: response.data["message"]);
  }

  //? verify email
  Future<MessageResponseModel> verifyEmail({
    required String otp,
    required String email,
  }) async {
    final response = await DioHelper.post(
      url: "auth/verify-email",
      data: {"otp": otp, "email": email},
    );

    return MessageResponseModel(message: response.data);
  }

  //? forgot password
  Future<MessageResponseModel> forgotPassword({required String email}) async {
    final response = await DioHelper.post(
      url: "auth/forgot-password",
      data: {"email": email},
    );

    return MessageResponseModel(message: response.data.toString());
  }

  //? validate otp
  Future<MessageResponseModel> validateOtp({
    required String otp,
    required String email,
  }) async {
    final response = await DioHelper.post(
      url: "auth/validate-otp",
      data: {"otp": otp, "email": email},
    );

    return MessageResponseModel(message: response.data);
  }

  //? reset password
  Future<MessageResponseModel> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    final response = await DioHelper.post(
      url: "auth/reset-password",
      data: {"email": email, "otp": otp, "newPassword": newPassword},
    );

    return MessageResponseModel(message: response.data);
  }
}
