import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProductListview extends StatelessWidget {
  const AddProductListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          final theme = Theme.of(context);
          return InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProductDetailsScreen()),
              // );
            },
            child: Card(
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
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
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Aurelian Solitaire Band",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  fontFamily: 'PlayfairDisplay',
                                ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "\$1,240.00",
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "In Stock: 12 units",
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/delete.svg",
                        height: 20,
                        width: 20,
                        // ignore: deprecated_member_use
                        color: theme.iconTheme.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
