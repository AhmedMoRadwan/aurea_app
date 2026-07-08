import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/custom_drawer.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DevDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        iconTheme: IconThemeData(color: AppColors.lightTextMuted),
        title: Text(
          'Aurea',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: AppColors.lightTextMuted,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.lightBackground,
            ),
          ),
        ],
      ),
      body: Center(child: Text('Product Listing Screen')),
    );
  }
}
