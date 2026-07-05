import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

class AuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 24,
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'AUREA',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.lightTextMuted,
        ),
      ),
    );
  }
}
