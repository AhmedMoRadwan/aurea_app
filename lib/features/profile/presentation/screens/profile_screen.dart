import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/screens/about_us_screen.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/custom_widgets.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/dark_mode_toggle.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/logout_bottom.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Profile",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,

        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_bag), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            const SizedBox(height: 20, width: 600),
            SectionCard(
              title: "ACCOUNT SETTINGS",
              children: const [
                CustomListTile(icon: Icons.person, title: "Edit Profile"),
                Divider(
                  height: 1,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.grey,
                ),

                CustomListTile(icon: Icons.lock, title: "Change Password"),
                Divider(
                  height: 1,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.grey,
                ),

                DarkModeToggle(),

                Divider(
                  height: 1,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.grey,
                ),
                CustomListTile(
                  icon: Icons.language,
                  title: "Language",
                  subtitle: "English (US)",
                ),
              ],
            ),
            const Gap(20),

            SectionCard(
              title: "SUPPORT & LEGAL",
              children: [
                CustomListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                  icon: Icons.privacy_tip,
                  title: "Privacy Policy",
                ),

                Divider(
                  height: 1,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.grey,
                ),

                CustomListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUsScreen(),
                      ),
                    );
                  },
                  icon: Icons.info,
                  title: "About Us",
                ),

                Divider(
                  height: 1,
                  endIndent: 20,
                  indent: 20,
                  color: Colors.grey,
                ),

                CustomListTile(icon: Icons.contact_mail, title: "Contact Us"),
              ],
            ),
            const SizedBox(height: 20),

            const LogoutButton(),

            const Gap(50),
          ],
        ),
      ),
    );
  }
}
