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
            onTap: () {},
            child: Card(
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  spacing: 15,
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
                                  fontFamily: 'PlayfairDisplay',
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
