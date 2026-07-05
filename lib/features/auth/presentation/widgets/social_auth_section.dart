import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/social_button.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SocialButton(
            onPressed: () {},
            iconPath: 'assets/icons/google.svg',
            title: 'Google',
          ),
        ),

        Gap(20),

        Expanded(
          child: SocialButton(
            onPressed: () {},
            iconPath: 'assets/icons/apple.svg',
            title: 'Apple',
          ),
        ),
      ],
    );
  }
}
