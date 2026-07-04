import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/custom_widgets.dart';
import 'package:nti_ecommerce_team4/features/profile/presentation/widgets/dark_mode_toggle.dart';

import '../widgets/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile",
            style: TextStyle(color: const Color(0xFF735C00))),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.menu,
              color: const Color(0xFF735C00)),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag, color: const Color(0xFF735C00)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            const SizedBox(height: 20 , width: 600),
            SectionCard(
              title: "ACCOUNT SETTINGS",
              children: const [
               
                CustomListTile(icon: Icons.person, title: "Edit Profile"),

                Divider(height: 1, endIndent: 20, indent: 20),

                CustomListTile(icon: Icons.lock, title: "Change Password"),
                Divider(height: 1, endIndent: 20, indent: 20),
                CustomListTile(
                  icon: Icons.dark_mode,
                  title: "Dark Mode",
                  trailing: Icon(Icons.toggle_off, color: Color(0xffE2DFDE), size: 40),
                ),
                Divider(height: 1, endIndent: 20, indent: 20),
                CustomListTile(
                  icon: Icons.language,
                  title: "Language",
                  subtitle: "English (US)",
                ),
              ],
            ),
            const SizedBox(height: 20),
            SectionCard(
              
              title: "SUPPORT & LEGAL",
              children: const [
                CustomListTile(icon: Icons.privacy_tip, title: "Privacy Policy"),
                Divider(height: 1, endIndent: 20, indent: 20),
                CustomListTile(icon: Icons.info, title: "About Us"),
                Divider(height: 1, endIndent: 20, indent: 20),
                CustomListTile(icon: Icons.contact_mail, title: "Contact Us"),
                Divider(height: 1, endIndent: 20, indent: 20),
              ],
            ),
            const SizedBox(height: 20),
            const LogoutButton(),
            const SizedBox(height: 10),
            const Text("Version 2.4.1 (AUREA-PRO)",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
      
    );
  }
}