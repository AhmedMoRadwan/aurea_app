

import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import 'auto_enhance_chip.dart';
import 'dash_rect_painter.dart';

class ImageDropzone extends StatefulWidget {
  const ImageDropzone({super.key});
  @override
  State<ImageDropzone> createState() => _ImageDropzoneState();
}

class _ImageDropzoneState extends State<ImageDropzone> {
  bool hasImage = false;
  bool enhanceOn = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return GestureDetector(
      onTap: () => setState(() => hasImage = !hasImage),
      child: Stack(
        children: [
          CustomPaint(
            painter: DashedRectPainter(
              color: AppColors.gold.withValues(alpha: 0.55),
              radius: 16,
            ),
            child: Container(
              width: double.infinity, height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: textPrimary.withValues(alpha: 0.02),
                borderRadius: BorderRadius.circular(16),
              ),
              child: hasImage
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?q=80&w=600&auto=format&fit=crop',
                  width: double.infinity, height: 200, fit: BoxFit.cover,
                ),
              )
                  : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add_photo_alternate_rounded, size: 34, color: AppColors.gold),
                  const SizedBox(height: 10),
                  Text('Drag and drop or click to upload',
                      style: AppTextStyles.bodyMedium.copyWith(color: textPrimary)),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'High-resolution studio photography recommended',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (hasImage)
            Positioned(
              top: 10, right: 10,
              child: AutoEnhanceChip(
                enabled: enhanceOn,
                onTap: () => setState(() => enhanceOn = !enhanceOn),
              ),
            ),
        ],
      ),
    );
  }
}
