import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/screens/login_screen.dart';

import '../widgets/onboarding_page.dart';

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
            imageUrl:
                'assets/images/dd776c2dee1ba8531d330bb78377822cdce767c6.png',
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onSkip: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          OnboardingPage(
            pageNumber: 2,
            title: 'Discover  Luxury Accessories',
            description:
                'Curated collections of the world\'s finest jewelry and accessories.',
            imageUrl:
                'assets/images/dd776c2dee1ba8531d330bb78377822cdce767c6.png',
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            onSkip: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          OnboardingPage(
            pageNumber: 3,
            title: 'Discover Luxury Accessories',
            description:
                'Curated collections of the world\'s finest jewelry and accessories.',
            imageUrl:
                'assets/images/dd776c2dee1ba8531d330bb78377822cdce767c6.png',
            onNext: () {
              // //! navigate to login

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            onSkip: () {
              // //! navigate to login

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
