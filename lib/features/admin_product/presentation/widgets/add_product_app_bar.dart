
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import 'avatar_edit_badge.dart';

class AddProductAppBar extends StatelessWidget {
  final VoidCallback onClose;
  const AddProductAppBar({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onClose,
            icon: Icon(Icons.close_rounded, color: textPrimary),
          ),
          Text(
            'Add Product',
            style: AppTextStyles.heading3.copyWith(color: textPrimary),
          ),
          const AvatarEditBadge(),
        ],
      ),
    );
  }
}



