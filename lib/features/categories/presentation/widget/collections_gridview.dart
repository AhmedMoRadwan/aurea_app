import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

class CollectionsGridView extends StatelessWidget {
  const CollectionsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.75,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: Color.fromARGB(255, 182, 182, 182),
              width: 1,
            ),
          ),

          child: Padding(
            padding: EdgeInsetsGeometry.all(15),
            child: InkWell(
              onTap: () {},

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/Aurea_logo.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'RINGS',
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
