import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SectionCard({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 249, 212, 2),
              ),
            ),
          ),
          SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            elevation: 2,
            child: Column(children: children),
          ),
        ],
      ),
      
    );
  }
}