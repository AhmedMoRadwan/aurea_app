import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).textTheme.headlineMedium?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(10),

        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
