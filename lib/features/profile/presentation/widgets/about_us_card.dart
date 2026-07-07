import 'package:flutter/material.dart';

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Aurea is a modern shopping application that helps customers "
              "discover premium fashion, accessories, jewelry, shoes, bags, "
              "and lifestyle products with a simple, secure, and enjoyable shopping experience.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
