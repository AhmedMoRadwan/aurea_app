import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

import '../../../products/presentation/screens/product_details_screen.dart';

class AllProductGridView extends StatelessWidget {
  const AllProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.70,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          elevation: 0,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailsScreen(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/Border.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),

                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: AppColors.darkBackground,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  'Infinity Diamond Ring',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '12,500 SAR',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 158, 125, 16),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    IconButton.filled(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      iconSize: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
