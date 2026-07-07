import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/onboarding/presentation/widgets/skip_button.dart';

import '../../../../core/theme/app_theme.dart';

class BrandNameAndSkipButton extends StatelessWidget {
  const BrandNameAndSkipButton({super.key,required this.onSkip});
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                'AUREA',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(

                    color: AppColors.gold,),
              ),

             SkipButton(onSkip: onSkip),
            ],
          ),
        ),
      ),
    );
  }
}
