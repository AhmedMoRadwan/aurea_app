import 'package:flutter/cupertino.dart';

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

              GestureDetector(
                onTap: onSkip,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFB8B8B8),
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
