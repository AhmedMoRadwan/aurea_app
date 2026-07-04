import 'package:flutter/material.dart';

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
              colors: [const Color(0xFF3A3A3A), const Color(0xFFF5F1E8)],
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
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
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
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1A1A1A),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),

                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF666666),
                          height: 1.5,
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