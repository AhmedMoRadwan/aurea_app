import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/signup_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/password_conditions.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppbar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/Background+Border.svg"),
                Text(
                  "New Password",
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.lightTextPrimary,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
                Gap(12),
                Text(
                  '''Create a new secure password for
                your account.''',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.lightTextSecondary,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
                Gap(40),
                CustomTextFormField(
                  labelText: "New Password",
                  suffixIcon: Icons.visibility,
                ),
                Gap(20),
                CustomTextFormField(
                  labelText: "Confirm Password",
                  suffixIcon: Icons.visibility,
                ),
                Gap(32),
                PasswordConditions(text: "At least 8 characters long"),
                Gap(5),
                PasswordConditions(text: "Contains a symbol or number"),
                Gap(32),
                CustomButton(
                  buttonText: "UPDATE PASSWORD",
                  onButtonPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
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
