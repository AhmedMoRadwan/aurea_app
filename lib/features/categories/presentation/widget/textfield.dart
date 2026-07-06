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

          borderSide: BorderSide.none,

        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),

          borderSide: BorderSide.none,
        ),

        prefixIcon: Icon(icon,size: 22,),

        hint: Text(
          hint,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color.fromARGB(255, 107, 106, 106)
          ),
        ),
      ),
    );
  }
}