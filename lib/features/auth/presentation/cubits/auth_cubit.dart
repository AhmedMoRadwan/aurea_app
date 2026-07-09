import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/core/network/token_manager.dart';
import 'package:nti_ecommerce_team4/features/auth/data/auth_repo/auth_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitialState());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.login(email: email, password: password);

      await TokenManager.saveToken(result.accessToken);

      emit(AuthSuccessState(result));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> register({required Map<String, dynamic> data}) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.register(data: data);

      emit(AuthSuccessState(result));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> verifyEmail({required String otp}) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.verifyEmail(otp: otp);

      emit(AuthSuccessState(result));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.forgotPassword(email: email);

      emit(AuthSuccessState(result));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> validateOtp({required String otp}) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.validateOtp(otp: otp);

      emit(AuthSuccessState(result));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.resetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );

      emit(AuthSuccessState(result));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }
}
