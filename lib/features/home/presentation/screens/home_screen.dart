
import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DevDrawer(),

      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,

        title: Text(
          "Aurea",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: AppColors.gold),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 24),
          ),

          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined, size: 24),
              ),

              Positioned(
                right: 6,
                top: 8,
                child: Container(
                  width: 14,
                  height: 14,
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

          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
