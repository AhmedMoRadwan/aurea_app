
import 'package:flutter/material.dart';
import 'package:nti_ecommerce_team4/core/theme/app_theme.dart';

class QuantitySectionWithLabel extends StatefulWidget {
  const QuantitySectionWithLabel({super.key});

  @override
  State<QuantitySectionWithLabel> createState() => _QuantitySectionWithLabelState();
}

class _QuantitySectionWithLabelState extends State<QuantitySectionWithLabel> {
  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (_quantity > 1) _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUANTITY',
          style: TextStyle(
            color: AppColors.lightTextPrimary,
            letterSpacing: 1,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _decrement,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Icon(Icons.remove, size: 18, color: AppColors.lightTextPrimary),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$_quantity',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: _increment,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Icon(Icons.add, size: 18, color: AppColors.lightTextPrimary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
