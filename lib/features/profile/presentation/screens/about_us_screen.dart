import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/about_us_card.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/custom_about_us_card.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/contact_card.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "About Us",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Theme.of(context).textTheme.headlineMedium?.color,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Aurea",
                style: ThemeData().textTheme.headlineLarge?.copyWith(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gold,
                  letterSpacing: 3,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
            ),

            const Gap(20),

            AboutUsCard(),

            const Gap(20),

            Text(
              "Why Choose Aurea?",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.headlineMedium?.color,
              ),
            ),

            const Gap(20),

            CustomAboutUsCard(
              icon: Icons.star_outline_rounded,
              title: "Premium Quality Products",
              subtitle:
                  "Handpicked collections from world-premium global brands.",
            ),

            const Gap(20),

            CustomAboutUsCard(
              icon: Icons.lock_outlined,
              title: "Secure Payments",
              subtitle: "End-to-end encryption ensures peace of mind.",
            ),

            const Gap(20),

            CustomAboutUsCard(
              icon: Icons.local_shipping_outlined,
              title: "Fast Delivery",
              subtitle: "Global shipping with convenient doorstep delivery.",
            ),

            const Gap(20),

            CustomAboutUsCard(
              icon: Icons.support_agent_outlined,
              title: "Friendly Customer Support",
              subtitle: "Dedicated assistance available for customer needs.",
            ),

            const Gap(20),

            ContactCard(),

            const Gap(20),
          ],
        ),
      ),
    );
  }
}
