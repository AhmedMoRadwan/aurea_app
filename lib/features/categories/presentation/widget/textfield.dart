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
        fillColor: const Color(0xffFFFFFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xffFFFFFF)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xffFFFFFF)),
        ),

        prefixIcon: Icon(icon,size: 22,),suffixIconColor: Color(0xff7F7663),
        hint: Text(
          hint,
          style: TextStyle(
            color: Color(0xff7f766399),
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
