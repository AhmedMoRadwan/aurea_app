import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/screens/admin_product_management_screen.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/screens/product_listing_screen.dart';

import '../../../products/presentation/screens/product_details_screen.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DevDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 1,

        // centerTitle: true,
        title: Text(
          "Aurea",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: AppColors.gold),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black54, size: 28),
          ),

          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black54,
                  size: 28,
                ),
              ),

              Positioned(
                right: 6,
                top: 8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD4AF37),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class DevDrawer extends StatelessWidget {
  const DevDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Developer Screen ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          ListTile(
            // leading: const Icon(Icons.),
            title: const Text('Product Details'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailsScreen(),
                ),
              );
            },
          ),

          ListTile(
            title: const Text('Product Listing'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductListing()),
              );
            },
          ),

          ListTile(
            title: const Text('Admin Product Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminProductManagement(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

