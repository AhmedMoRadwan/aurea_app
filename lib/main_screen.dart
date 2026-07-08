import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/constants/custom_bottom_nav_bar.dart';
import 'package:nti_ecommerce_team4/features/cart/presentation/screens/cart_screen.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/screen/categorie_screen.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/screens/home_screen.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    const CategorieScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
