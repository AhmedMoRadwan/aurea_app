import 'package:flutter/material.dart';

import '../widgets/next_button.dart';
import '../widgets/number_and_next_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {});
        },
        children: [
          OnboardingPage(
            pageNumber: 1,
            title: 'Discover  Luxury Accessories',
            description:
                'Curated collections of the world\'s finest jewelry and accessories.',
            imageUrl: 'assets/jewelry1.png',
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onSkip: () {},
          ),
          OnboardingPage(
            pageNumber: 2,
            title: 'Discover  Luxury Accessories',
            description:
                'Curated collections of the world\'s finest jewelry and accessories.',
            imageUrl: 'assets/jewelry2.png',
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onSkip: () {},
          ),
          OnboardingPage(
            pageNumber: 3,
            title: 'Discover Luxury Accessories',
            description:
                'Curated collections of the world\'s finest jewelry and accessories.',
            imageUrl: 'assets/jewelry3.png',
            onNext: () {},
            onSkip: () {},
          ),
        ],
      ),
    );
  }
}

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

        Positioned(
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
                  // Brand Name
                  Text(
                    'AUREA',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFD4AF37),
                      letterSpacing: 2,
                    ),
                  ),
                  // Skip Button
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
        ),

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
