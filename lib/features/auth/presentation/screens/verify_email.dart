import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/login_screen.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_appbar.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_header.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/otp_input_section.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppbar(),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20, top: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* AuthHeader
              const AuthHeader(
                title: 'Verification',
                subtitle: 'Enter the 4-digit code sent to your email.',
              ),
              const Gap(40),

              //* Verification Code
              OtpInputSection(
                onCompleted: (code) {
                  log(code);
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
                      builder: (context) => const LoginScreen(),
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
