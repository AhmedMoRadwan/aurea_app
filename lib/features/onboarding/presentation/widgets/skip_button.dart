
import 'package:flutter/cupertino.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onSkip});
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onSkip,
      child: Text(
        'Skip',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFB8B8B8),
        ),
      ),
    );
  }
}
