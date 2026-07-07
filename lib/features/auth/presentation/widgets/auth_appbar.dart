import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

class AuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: AppColors.lightTextMuted,
        ),
      ),
      title: Text(
        "Aurea",
        style: AppTextStyles.heading1.copyWith(
          color: AppColors.lightTextMuted,
          fontFamily: 'PlayfairDisplay',
        ),
      ),
      centerTitle: true,
    );
  }
}
