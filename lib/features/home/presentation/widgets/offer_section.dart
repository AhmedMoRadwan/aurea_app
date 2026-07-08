import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';

class OfferSection extends StatelessWidget {
  const OfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/Border.png",
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black54, Colors.transparent],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 25, top: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'SPECIAL COLLECTION',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.4,
                  color: AppColors.darkText,
                  fontFamily: 'Inter',
                ),
              ),

              Text(
                '''Up to 30%
OFF''',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.96,
                  color: AppColors.darkText,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                ),
                child: Text(
                  'Shop Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                    color: AppColors.darkGold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
