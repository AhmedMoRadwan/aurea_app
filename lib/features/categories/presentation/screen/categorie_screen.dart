import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/widgets/collections_gridview.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/widgets/textfield.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/drawer.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({super.key});

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffFBF9F9),
      drawer: const DevDrawer(),

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 158, 125, 16),
        ),

        title: Text(
          "AUREA",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: const Color.fromARGB(255, 158, 125, 16),
            fontFamily: 'PlayfairDisplay',
          ),
        ),
        centerTitle: true,

        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,

        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_bag_outlined, size: 28),
              ),

              Positioned(
                right: 6,
                top: 8,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
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

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              SizedBox(height: 8),

              Text(
                'Collections',
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),

              Textfield(icon: Icons.search, hint: 'Search our archives...'),

              SizedBox(height: 5),
              Expanded(child: CollectionsGridView()),
            ],
          ),
        ),
      ),
    );
  }
}
