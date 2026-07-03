import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/main_screen.dart';
import '../widgets/auth_divider.dart';
import '../widgets/auth_header.dart';
import 'package:gap/gap.dart';
import '../widgets/auth_redirect_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/social_auth_section.dart';
import 'forget_password_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            children: [
              //* AuthHeader
              const AuthHeader(
                title: 'Welcome Back',
                subtitle: '''Sign in to continue your luxury shopping
                       experience.''',
              ),
              const Gap(25),

              //* Email TextFormField
              const CustomTextFormField(
                labelText: 'Email',
                prefixIcon: Icons.email,
              ),

              const Gap(25),

              //* Password TextFormField
              const CustomTextFormField(
                labelText: 'Password',
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility,
              ),
              const Gap(5),

              //* Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text('Forget Password?'),
                ),
              ),

              const Gap(25),

              //* Login Button
              CustomButton(
                buttonText: 'LOGIN',
                onButtonPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
              ),

              const Gap(25),

              //* Alternative Login Options
              const AuthDivider(dividerText: 'OR CONTINUE WITH'),

              const Gap(25),

              //* Social Auth Section
              const SocialAuthSection(),

              const Gap(25),

              //* Dont have an account
              AuthRedirectText(
                question: 'Don\'t have an account?',
                actionText: 'Sign Up  ',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  );
                },
              ),

              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
