import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

class CustomAboutUsCard extends StatelessWidget {
  const CustomAboutUsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.goldSoft,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 30, color: AppColors.gold),
            ),

            Gap(10),

            Text(
              title,
              style: ThemeData().textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),

            Gap(10),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: ThemeData().textTheme.bodyLarge?.copyWith(
                fontSize: 15,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
