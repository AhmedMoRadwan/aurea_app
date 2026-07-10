import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/core/utils/validators.dart';
import 'package:nti_ecommerce_team4/features/auth/data/auth_repo/auth_repo.dart';
import 'package:nti_ecommerce_team4/features/auth/data/date_source/auth_remote_data_source.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/cubits/auth_state.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/verification_OTP_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final GlobalKey<FormState> myKey = GlobalKey();
    //final theme = Theme.of(context);
    return Scaffold(
      appBar: AuthAppbar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: myKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot Password",
                    style: AppTextStyles.heading1.copyWith(
                      color: Theme.of(context).textTheme.headlineMedium?.color,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  Gap(12),

                  Text(
                    'Please enter your email address to receive a verification code.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMedium.copyWith(
                      // color: AppColors.lightTextSecondary,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  Gap(40),
                  CustomTextFormField(
                    labelText: "Email Address",
                    controller: emailController,
                    validator: (email) {
                      return Validator.validateEmail(email!);
                    },
                  ),
                  Gap(40),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (state is AuthSuccessState) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) =>
                                  AuthCubit(AuthRepo(AuthRemoteDataSource())),
                              child: VerificationOtpScreen(
                                email: emailController.text,
                              ),
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "If the email is registered, you will receive an OTP to reset your password.",
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
                          buttonText: "Next",
                          onButtonPressed: () async {
                            if (myKey.currentState!.validate()) {
                              await context.read<AuthCubit>().forgotPassword(
                                email: emailController.text,
                              );
                            } else {
                              log("VALIDATION ERROR");
                            }
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
