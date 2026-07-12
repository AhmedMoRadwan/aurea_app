import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/core/error/api_exception.dart';
import 'package:nti_ecommerce_team4/core/network/token_manager.dart';
import 'package:nti_ecommerce_team4/features/auth/data/auth_repo/auth_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitialState());

  //? Login
  Future<void> login({required String email, required String password}) async {
    //* Loading state
    emit(AuthLoadingState());

    try {
      final result = await authRepo.login(email: email, password: password);
      //* Save token
      await TokenManager.saveToken(result.accessToken);
      //* Success state
      emit(AuthSuccessState(result));
      //* Error state
    } on ApiException catch (e) {
      emit(AuthErrorState(errorMessage: e.message));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  //? Register
  Future<void> register({required Map<String, dynamic> data}) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.register(data: data);

      emit(AuthSuccessState(result));
    } on ApiException catch (e) {
      emit(AuthErrorState(errorMessage: e.message));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  //? Verify Email
  Future<void> verifyEmail({required String otp, required String email}) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.verifyEmail(otp: otp, email: email);

      emit(AuthSuccessState(result));
    } on ApiException catch (e) {
      emit(AuthErrorState(errorMessage: e.message));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  //? Forgot Password
  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.forgotPassword(email: email);

      emit(ForgetSuccessState(msg: result));
    } on ApiException catch (e) {
      emit(AuthErrorState(errorMessage: e.message));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  //? Validate OTP
  Future<void> validateOtp({required String otp, required String email}) async {
    emit(AuthLoadingState());

    try {
      final result = await authRepo.validateOtp(otp: otp, email: email);

      emit(OTPSuccessState(msg: result));
    } on ApiException catch (e) {
      emit(AuthErrorState(errorMessage: e.message));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  //? Reset Password
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

      emit(NewPassSuccessState(msg: result));
    } on ApiException catch (e) {
      emit(AuthErrorState(errorMessage: e.message));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> resendOtp({required String email}) async {
    emit(ResendOtpLoadingState());

    try {
      final result = await authRepo.resendOtp(email: email);

      emit(ResendOtpSuccessState(msg: result));
    } on ApiException catch (e) {
      emit(ResendOtpFailureState(errorMessage: e.message));
    } catch (e) {
      emit(ResendOtpFailureState(errorMessage: e.toString()));
    }
  }
}
