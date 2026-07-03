import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';

import 'package:nti_ecommerce_team4/features/products/presentation/screens/product_details_screen.dart';

class AddProductGridview extends StatelessWidget {
  const AddProductGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.25,
        crossAxisCount: 1,
        mainAxisSpacing: 16,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        final theme = Theme.of(context);
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailsScreen()),
            );
          },
          child: Card(
            color: AppColors.lightBg,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                spacing: 10,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/product.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 3,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Aurelian Solitaire Band",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                        ),
                        Text(
                          "\$1,240.00",
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "In Stock: 12 units",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/delete.svg",
                      height: 20,
                      width: 20,
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
