import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            policyCard(
              icon: Icons.privacy_tip,
              title: "Your Privacy",
              subtitle:
                  "We respect your privacy and are committed to protecting your personal information. "
                  "We believe in data minimization and only hold what is essential for your experience.",
            ),

            const SizedBox(height: 20),

            policyCard(
              icon: Icons.info,
              title: "Information We Collect",
              subtitle:
                  "We may collect your name, email address, phone number, and shipping address to process your orders. "
                  "Additionally, we may store purchase history to offer personalized recommendations.",
            ),

            const SizedBox(height: 20),

            policyCard(
              icon: Icons.data_usage,
              title: "How We Use Your Information",
              subtitle:
                  "Your information is used to complete purchases, improve the application, and provide customer support. "
                  "We use anonymized data to analyze shopping trends and optimize inventory.",
            ),

            const SizedBox(height: 20),

            policyCard(
              icon: Icons.security,
              title: "Data Security",
              subtitle:
                  "We use industry-standard security practices to keep your information safe. "
                  "This includes end-to-end encryption for transactions and periodic security audits of our internal systems.",
            ),

            const SizedBox(height: 40),

            contactCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget policyCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.gold, size: 36),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget contactCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: AppColors.gold,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            const Icon(Icons.email_outlined, color: Colors.white, size: 40),

            const SizedBox(height: 15),

            // Title in center
            const Text(
              "Contact Us",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.lightBackground,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Have questions about your data? Reach out to our privacy officer.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: AppColors.darkTextPrimary,
              ),
            ),

            const SizedBox(height: 25),

            // Email box
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "support@novamart.com",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.lightTextMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
