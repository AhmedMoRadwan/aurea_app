import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/user5.jpg"),
              ),
            ),
            CircleAvatar(
              radius: 15,
              backgroundColor: const Color(0xFFD4AF37),
              child: const Icon(
                Icons.edit,
                size: 15,
                color: Color(0xFF554300),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Aurelian Vance",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        Text(
          "aurelian.vance@aurea.com",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
