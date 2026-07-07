
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final sellerId = TextEditingController();
  final nameEn = TextEditingController();
  final nameAr = TextEditingController();
  final price = TextEditingController();
  final stock = TextEditingController(text: '1');
  final color = TextEditingController();
  final descEn = TextEditingController();
  final descAr = TextEditingController();

  @override
  void dispose() {
    for (final c in [sellerId, nameEn, nameAr, price, stock, color, descEn, descAr]) {
      c.dispose();
    }
    super.dispose();
  }

  void _save() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark ? AppColors.lightSurface : AppColors.darkSurface,
        content: Text(
          'Product saved',
          style: (isDark ? AppTextStyles.bodyMedium.copyWith(color: AppColors.lightTextPrimary) 
                         : AppTextStyles.bodyMedium.copyWith(color: AppColors.darkTextPrimary))
                .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddProductAppBar(onClose: () => Navigator.maybePop(context)),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionCard(
                      title: 'Product Image',
                      child: ImageDropzone(),
                    ),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: 'Basic Information',
                      child: Column(
                        children: [
                          AureaTextField(label: 'Seller ID', hint: 'e.g. d051dbf3...', controller: sellerId),
                          const SizedBox(height: 14),
                          AureaTextField(label: 'Product Name', hint: 'e.g. Aurelia...', controller: nameEn),
                          const SizedBox(height: 14),
                          AureaTextField(label: 'Product Name (Arabic)', hint: 'اسم المنتج', controller: nameAr, rtl: true),
                          const SizedBox(height: 14),
                          AureaTextField(
                            label: 'Price (SAR)', 
                            hint: '0.00', 
                            controller: price, 
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            suffix: 'SAR',
                          ),
                          const SizedBox(height: 14),
                          AureaTextField(label: 'Stock', hint: '1', controller: stock, keyboardType: TextInputType.number),
                          const SizedBox(height: 14),
                          AureaTextField(label: 'Color', hint: 'e.g. 18K Yellow Gold', controller: color),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: 'Product Narrative',
                      child: Column(
                        children: [
                          AureaTextArea(label: 'Description', hint: 'Describe the craftsmanship...', controller: descEn),
                          const SizedBox(height: 14),
                          AureaTextArea(label: 'Description (Arabic)', hint: 'وصف المنتج...', controller: descAr, rtl: true),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _save,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gold,
                          foregroundColor: isDark ? AppColors.darkBackground : AppColors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(
                          'Save Product',
                          style: AppTextStyles.buttonText.copyWith(
                            color: isDark ? AppColors.darkBackground : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddProductAppBar extends StatelessWidget {
  final VoidCallback onClose;
  const AddProductAppBar({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 16, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onClose,
            icon: Icon(Icons.close_rounded, color: textPrimary),
          ),
          Text(
            'Add Product',
            style: AppTextStyles.heading3.copyWith(color: textPrimary),
          ),
          const _AvatarEditBadge(),
        ],
      ),
    );
  }
}

class _AvatarEditBadge extends StatelessWidget {
  const _AvatarEditBadge();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: 40, height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.gold.withValues(alpha: 0.15),
            ),
          ),
          Positioned(
            right: -2, bottom: -2,
            child: Container(
              width: 20, height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                border: Border.all(
                  color: isDark ? AppColors.darkBackground : AppColors.white,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.crop_rounded,
                size: 11,
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  const SectionCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: textPrimary.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.heading3.copyWith(color: textPrimary, fontSize: 17)),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

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
            painter: _DashedRectPainter(
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
              child: _AutoEnhanceChip(
                enabled: enhanceOn,
                onTap: () => setState(() => enhanceOn = !enhanceOn),
              ),
            ),
        ],
      ),
    );
  }
}

class _AutoEnhanceChip extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;
  const _AutoEnhanceChip({required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: enabled ? AppColors.gold : Colors.black.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.hd_rounded, size: 14, color: enabled ? (isDark ? AppColors.darkBackground : AppColors.white) : AppColors.white),
            const SizedBox(width: 4),
            Text(
              'Auto Enhance',
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 11, fontWeight: FontWeight.w700,
                color: enabled ? (isDark ? AppColors.darkBackground : AppColors.white) : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  final Color color;
  final double radius;
  _DashedRectPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..style = PaintingStyle.stroke..strokeWidth = 1.4;
    final rrect = RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius));
    final path = Path()..addRRect(rrect);
    const dashWidth = 6.0;
    const gapWidth = 5.0;
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(metric.extractPath(distance, next.clamp(0, metric.length)), paint);
        distance = next + gapWidth;
      }
    }
  }
  @override
  bool shouldRepaint(covariant _DashedRectPainter oldDelegate) => oldDelegate.color != color || oldDelegate.radius != radius;
}

class AureaTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? suffix;
  final bool rtl;

  const AureaTextField({
    super.key, required this.label, required this.hint, required this.controller,
    this.keyboardType, this.suffix, this.rtl = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textSecondary = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600, color: textSecondary)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: rtl ? TextAlign.right : TextAlign.left,
          style: AppTextStyles.bodyMedium.copyWith(color: textPrimary),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(color: textSecondary),
            suffixText: suffix,
            suffixStyle: AppTextStyles.bodySmall.copyWith(
              color: isDark ? AppColors.darkTextMuted : const Color(0xFFB8860B),
              fontWeight: FontWeight.w700,
            ),
            filled: true,
            fillColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: AppColors.gold, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}

class AureaTextArea extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool rtl;
  const AureaTextArea({super.key, required this.label, required this.hint, required this.controller, this.rtl = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textSecondary = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600, color: textSecondary)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: 4,
          textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
          textAlign: rtl ? TextAlign.right : TextAlign.left,
          style: AppTextStyles.bodyMedium.copyWith(color: textPrimary),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(14),
            hintText: hint,
            hintStyle: AppTextStyles.bodyMedium.copyWith(color: textSecondary),
            filled: true,
            fillColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.gold, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}
