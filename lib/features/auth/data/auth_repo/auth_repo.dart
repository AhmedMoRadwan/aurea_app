import 'package:nti_ecommerce_team4/features/auth/data/date_source/auth_remote_data_source.dart';

import '../models/login_response_model.dart';
import '../models/message_response_model.dart';

class AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepo(this.remoteDataSource);

  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.login(email: email, password: password);
  }

  Future<MessageResponseModel> register({
    required Map<String, dynamic> data,
  }) async {
    return await remoteDataSource.register(data: data);
  }

  Future<MessageResponseModel> verifyEmail({required String otp}) async {
    return await remoteDataSource.verifyEmail(otp: otp);
  }

  Future<MessageResponseModel> forgotPassword({required String email}) async {
    return await remoteDataSource.forgotPassword(email: email);
  }

  Future<MessageResponseModel> validateOtp({required String otp}) async {
    return await remoteDataSource.validateOtp(otp: otp);
  }

  Future<MessageResponseModel> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    return await remoteDataSource.resetPassword(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );
  }
}
