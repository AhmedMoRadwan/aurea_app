import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../widgets/cornerPainter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: 60,
                height: 60,
                child: CustomPaint(painter: CornerPainter()),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: 60,
                height: 60,
                child: CustomPaint(painter: CornerPainter(isRight: true)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppColors.gold.withOpacity(0.2),
                              AppColors.gold.withOpacity(0.05),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.gold.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Aurea',
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(
                                  color: AppColors.gold,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  Text(
                    'AUREA',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColors.gold,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Tagline
                  Text(
                    'FINE JEWELRY & ARTISTRY',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.darkTextSecondary,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Row(
                          children: List.generate(3, (index) {
                            final delay = index * 0.15;
                            final position =
                                (_animationController.value - delay) % 1.0;
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.gold
                                    .withOpacity(0.2)
                                    .withOpacity((position * 2 - 1).abs()),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Text(
                  'INITIALIZING EXPERIENCE',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: 60,
                height: 60,
                child: CustomPaint(painter: CornerPainter(isBottom: true)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
