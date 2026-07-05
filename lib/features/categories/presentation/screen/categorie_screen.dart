import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/widget/collections_gridview.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/widget/textfield.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/drawer.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/dark_mode_toggle.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DevDrawer(),

      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(height: 1, color: Colors.grey.shade400),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
          size: 24,
        ),

        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,

        // title: CircleAvatar(
        //   radius: 18,
        //   backgroundImage: AssetImage('assets/images/Aurea_logo.jpg'),
        // ),
        // centerTitle: true,
        title: Text(
          "AUREA",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.gold,
            fontFamily: 'PlayfairDisplay',
          ),
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag_outlined, size: 28),
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
