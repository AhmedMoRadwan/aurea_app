import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/login_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_divider.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/social_button.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/dark_mode_toggle.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.lightSurface,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Gap(50),
              const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 130,
                width: 130,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                  decoration: BoxDecoration(
                    // color: AppColors.lightBackground,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.lightBorder),
                  ),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(8),
                      Text(
                        "Create Account",
                        style: AppTextStyles.heading1.copyWith(
                          color: AppColors.lightTextMuted,
                          fontFamily: 'PlayfairDisplay',
                        ),
                      ),
                      Text(
                        "Join the world of exquisite craftsmanship",
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.lightTextSecondary,
                        ),
                      ),
                      const Gap(15),

                      CustomTextFormField(labelText: "Full Name"),

                      CustomTextFormField(labelText: "Email"),

                      CustomTextFormField(
                        labelText: "Password",
                        suffixIcon: Icons.visibility,
                      ),

                      CustomTextFormField(
                        labelText: "Confirm Password",
                        suffixIcon: Icons.visibility,
                      ),

                      CustomButton(
                        buttonText: 'Create Account',
                        onButtonPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                      const Gap(8),

                      const AuthDivider(dividerText: 'OR SIGN UP WITH'),

                      const Gap(15),

                      Row(
                        spacing: 30,
                        children: [
                          Expanded(
                            child: SocialButton(
                              iconPath: "assets/icons/google.svg",
                              title: "Google",
                            ),
                          ),

                          Expanded(
                            child: SocialButton(
                              iconPath: "assets/icons/apple.svg",
                              title: "Apple",
                            ),
                          ),
                        ],
                      ),
                      const Gap(8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
