import 'package:nti_ecommerce_team4/features/auth/data/models/message_response_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final Object data;

  AuthSuccessState(this.data);
}

class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState({required this.errorMessage});
}

class ForgetSuccessState extends AuthState {
  final MessageResponseModel msg;
  ForgetSuccessState({required this.msg});
}

class OTPSuccessState extends AuthState {
  final MessageResponseModel msg;
  OTPSuccessState({required this.msg});
}

class NewPassSuccessState extends AuthState {
  final MessageResponseModel msg;
  NewPassSuccessState({required this.msg});
}

class ResendOtpLoadingState extends AuthState {}

class ResendOtpFailureState extends AuthState {
  final String errorMessage;

  ResendOtpFailureState({required this.errorMessage});
}

class ResendOtpSuccessState extends AuthState {
  final MessageResponseModel msg;
  ResendOtpSuccessState({required this.msg});
}
