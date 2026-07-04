import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({super.key, required this.icon, required this.hint});
  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        prefixIcon: Icon(icon, size: 20),
        hint: Text(
          hint,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
