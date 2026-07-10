import 'package:dio/dio.dart';
import 'package:nti_ecommerce_team4/core/error/api_error_model.dart';
import 'package:nti_ecommerce_team4/core/error/api_exception.dart';
import 'package:nti_ecommerce_team4/features/auth/data/date_source/auth_remote_data_source.dart';

import '../models/login_response_model.dart';
import '../models/message_response_model.dart';

class AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepo(this.remoteDataSource);

  //? Login
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      return await remoteDataSource.login(email: email, password: password);
    } on DioException catch (e) {
      final error = ApiErrorModel.fromJson(e.response?.data ?? {});

      throw ApiException(error.errorMessage);
    }
  }

  //? Register
  Future<MessageResponseModel> register({
    required Map<String, dynamic> data,
  }) async {
    try {
      return await remoteDataSource.register(data: data);
    } on DioException catch (e) {
      final error = ApiErrorModel.fromJson(e.response?.data ?? {});

      throw ApiException(error.errorMessage);
    }
  }

  //? Verify email
  Future<MessageResponseModel> verifyEmail({
    required String otp,
    required String email,
  }) async {
    try {
      return await remoteDataSource.verifyEmail(otp: otp, email: email);
    } on DioException catch (e) {
      final error = ApiErrorModel.fromJson(e.response?.data ?? {});

      throw ApiException(error.errorMessage);
    }
  }

  //? Forgot password
  Future<MessageResponseModel> forgotPassword({required String email}) async {
    try {
      return await remoteDataSource.forgotPassword(email: email);
    } on DioException catch (e) {
      final error = ApiErrorModel.fromJson(e.response?.data ?? {});

      throw ApiException(error.errorMessage);
    }
  }

  //? Validate otp
  Future<MessageResponseModel> validateOtp({
    required String otp,
    required String email,
  }) async {
    try {
      return await remoteDataSource.validateOtp(otp: otp, email: email);
    } on DioException catch (e) {
      final error = ApiErrorModel.fromJson(e.response?.data ?? {});

      throw ApiException(error.errorMessage);
    }
  }

  //? Reset password
  Future<MessageResponseModel> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      return await remoteDataSource.resetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );
    } on DioException catch (e) {
      final error = ApiErrorModel.fromJson(e.response?.data ?? {});

      throw ApiException(error.errorMessage);
    }
  }
}
