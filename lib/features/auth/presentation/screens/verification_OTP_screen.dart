import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_header.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
import '../widgets/otp_input_section.dart';

class VerificationOtpScreen extends StatelessWidget {
  const VerificationOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  print(code);
                },
                onResend: () {
                  // API
                },
              ),

              //* Verify Button
              CustomButton(
                buttonText: 'Verify',
                onButtonPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateNewPasswordScreen(),
                    ),
                  );
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
