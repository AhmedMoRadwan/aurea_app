import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {},
      icon: Icon(Icons.logout, color: AppColors.error),
      label: Text(
        "Logout",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.error,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
