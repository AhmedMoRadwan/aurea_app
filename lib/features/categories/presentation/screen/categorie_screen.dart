import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/widget/collections_gridview.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/widget/textfield.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/widgets/drawer.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF9F9),
      drawer: const DevDrawer(),

      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff735C00)),
        backgroundColor: Color(0xffFBF9F9),
        surfaceTintColor: Colors.white,
        elevation: 1,

        bottom: PreferredSize(preferredSize: Size.fromHeight(1), child: Container(
          height: 1,
          color: Color(0xffF7F2E6),
        )),

        title: CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/images/Aurea_logo.jpg'),
        ),
        centerTitle: true,

        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
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

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              SizedBox(height: 15),
              Text(
                'Collections',
                style: TextStyle(
                  color: Color(0xff1B1C1C),
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
