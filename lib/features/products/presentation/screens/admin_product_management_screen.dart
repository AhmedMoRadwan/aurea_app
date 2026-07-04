import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/auth/presentation/widgets/add_product_gridview.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/screens/home_screen.dart';

class AdminProductManagement extends StatelessWidget {
  const AdminProductManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      drawer: DevDrawer(),
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: AppColors.lightTextMuted),
        title: Text(
          'Products',
          style: AppTextStyles.heading2.copyWith(
            color: theme.colorScheme.onSurface,
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
      backgroundColor: Color(0xffFBF9F9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Expanded(
            child: Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "INVENTORY",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  "24 Items",
                  style: AppTextStyles.heading2.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 20),
                AddProductListview(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
