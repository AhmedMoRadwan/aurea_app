
import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/drawer.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/offer_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DevDrawer(),

      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff735C00)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 1,

        // centerTitle: true,
        title: Text(
          "AUREA",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.darkGold,
            fontFamily: 'PlayfairDisplay',
          ),
        ),
        centerTitle: true,

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: Color(0xffF7F2E6)),
        ),

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

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 48,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: OfferSection(),
                ),

                Column(
                  spacing: 16,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                        color: Color(0xff1B1C1C),
                        fontFamily: 'PlayfairDisplay',
                      ),
                    ),
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
