import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/features/auth/data/auth_repo/auth_repo.dart';
import 'package:nti_ecommerce_team4/features/auth/data/date_source/auth_remote_data_source.dart';
// import 'package:nti_ecommerce_team4/features/auth/data/auth_repo/auth_repo.dart';
// import 'package:nti_ecommerce_team4/features/auth/data/date_source/auth_remote_data_source.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_state.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_header.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
import '../widgets/otp_input_section.dart';

class VerificationOtpScreen extends StatefulWidget {
  const VerificationOtpScreen({super.key, required this.email});
  final String email;

  @override
  State<VerificationOtpScreen> createState() => _VerificationOtpScreenState();
}

class _VerificationOtpScreenState extends State<VerificationOtpScreen> {
  @override
  Widget build(BuildContext context) {
    String? otp;
    return Scaffold(
      appBar: const AuthAppbar(),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20, top: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* AuthHeader
              const AuthHeader(
                title: 'Verification',
                subtitle: 'Enter the 6-digit code sent to your email.',
              ),

              const Gap(40),

              //* Verification Code
              OtpInputSection(
                onCompleted: (code) {
                  otp = code;
                },
                onResend: () {
                  context.read<AuthCubit>().resendOtp(email: widget.email);
                },
              ),

              //* Verify Button
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (state is OTPSuccessState) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) =>
                              AuthCubit(AuthRepo(AuthRemoteDataSource())),

                          child: CreateNewPasswordScreen(
                            email: widget.email,
                            otp: otp!,
                          ),
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.msg.message,
                          // "OTP is valid."
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return CustomButton(
                      buttonText: 'Verify',
                      onButtonPressed: () {
                        context.read<AuthCubit>().validateOtp(
                          email: widget.email,
                          otp: otp!,
                        );
                      },
                    );
                  }
                },
              ),

              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
