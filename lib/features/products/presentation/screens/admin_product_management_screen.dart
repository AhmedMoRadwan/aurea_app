import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/screens/home_screen.dart';

class AdminProductManagement extends StatelessWidget {
  const AdminProductManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DevDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        iconTheme: IconThemeData(color: AppColors.lightTextMuted),
        title: Text(
          'Products',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.lightBackground,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.lightBackground,
            ),
          ),
        ],
      ),
    );
  }
}
