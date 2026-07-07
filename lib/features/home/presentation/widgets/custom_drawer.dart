import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/screens/admin_product_management_screen.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/screens/product_details_screen.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/screens/product_listing_screen.dart';

class DevDrawer extends StatelessWidget {
  const DevDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            // decoration: BoxDecoration(color: Colors.white),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Developer Screen ',
                style: TextStyle(
                  // color: Colors.black,
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
