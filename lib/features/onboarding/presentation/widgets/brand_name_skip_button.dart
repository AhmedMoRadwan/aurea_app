import 'package:flutter/cupertino.dart';
import 'package:nti_ecommerce_team4/features/onboarding/presentation/widgets/skip_button.dart';

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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFD4AF37),
                  letterSpacing: 2,
                ),
              ),

             SkipButton(onSkip: onSkip),
            ],
          ),
        ),
      ),
    );
  }
}
