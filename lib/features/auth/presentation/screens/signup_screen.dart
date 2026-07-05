import 'package:flutter/material.dart';
//import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
//import 'package:nti_ecommerce_team4/features/auth/presentation/screens/login_screen.dart';
//import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/auth_divider.dart';
//import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_button.dart';
//import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/custom_text_form_field.dart';
//import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/social_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: AppColors.lightTextMuted,
          ),
        ),
        title: Text(
          "Aurea",
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.lightTextMuted,
            fontFamily: 'PlayfairDisplay',
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
