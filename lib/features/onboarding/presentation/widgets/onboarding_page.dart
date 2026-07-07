import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import 'brand_name_skip_button.dart';
import 'number_and_next_button.dart';

class OnboardingPage extends StatelessWidget {
  final int pageNumber;
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingPage({
    super.key,
    required this.pageNumber,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.darkBackground,AppColors.white ],
              stops: const [0.0, 0.35],
            ),
          ),
        ),
        BrandNameAndSkipButton(onSkip: onSkip),
        Positioned.fill(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.darkTextSecondary,
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: AppColors.darkBackground,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            height: 1.2
                        ),
                      ),
                      const SizedBox(height: 16),

                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.darkTextSecondary,
                          letterSpacing: 1,
                          height: 1.2
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        NumberAndNextButton(pageNumber: pageNumber, onNext: onNext),
      ],
    );
  }
}
