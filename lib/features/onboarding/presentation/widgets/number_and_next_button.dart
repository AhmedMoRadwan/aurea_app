import 'package:flutter/cupertino.dart';

import 'next_button.dart';

class NumberAndNextButton extends StatelessWidget {
  const NumberAndNextButton({super.key, required this.pageNumber, required this.onNext});
  final int pageNumber;
  final VoidCallback onNext;


  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '0$pageNumber / 03',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1A1A1A),
                  letterSpacing: 1,
                ),
              ),

              NextButton(onNext: onNext),
            ],
          ),
        ),
      ),
    );
  }
}
