import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/all_product_gridview.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/drawer.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/explore_listview.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/offer_section.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/custom_drawer.dart'
    hide DevDrawer;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DevDrawer(),

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 158, 125, 16),
        ),
        // surfaceTintColor: Colors.white,
        // elevation: 1,

        title: Text(
          "AUREA",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: const Color.fromARGB(255, 158, 125, 16),
            fontFamily: 'PlayfairDisplay',
          ),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 28),
          ),

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

          const SizedBox(width: 8),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 40,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: OfferSection(),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),

                    SizedBox(height: 120, child: ExploreListView()),
                  ],
                ),

                Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'All Products',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),

                    AllProductGridView(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
