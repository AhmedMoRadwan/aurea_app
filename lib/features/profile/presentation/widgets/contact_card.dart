import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/contact_widget.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Get in Touch",
              style: ThemeData().textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),

            const Gap(20),

            ContactWidget(icon: Icons.email, text: "support@aurea.com"),

            const Gap(20),

            ContactWidget(icon: Icons.phone, text: "01023084409"),

            const Gap(20),

            ContactWidget(icon: Icons.language, text: "www.aurea.com"),
          ],
        ),
      ),
    );
  }
}
