import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/verification_OTP_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return Scaffold(
      appBar: AuthAppbar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot Password",
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.lightTextPrimary,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
                Gap(12),
                Text(
                  'Enter your email address to receive a verification code.',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.lightTextSecondary,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
                Gap(40),
                CustomTextFormField(labelText: "EMAIL ADDRESS"),
                Gap(40),
                CustomButton(
                  buttonText: "SEND CODE",
                  onButtonPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerificationOtpScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
