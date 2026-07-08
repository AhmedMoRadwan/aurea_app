import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/add_product_app_bar.dart';
import '../widgets/aurea_text_area.dart';
import '../widgets/aurea_text_field.dart';
import '../widgets/image_drop_zone.dart';
import '../widgets/section_card.dart';

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
    for (final c in [
      sellerId,
      nameEn,
      nameAr,
      price,
      stock,
      color,
      descEn,
      descAr,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _save() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark
            ? AppColors.lightSurface
            : AppColors.darkSurface,
        content: Text(
          'Product saved',
          style:
              (isDark
                      ? AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.lightTextPrimary,
                        )
                      : AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.darkTextPrimary,
                        ))
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
                          AureaTextField(
                            label: 'Seller ID',
                            hint: 'e.g. d051dbf3...',
                            controller: sellerId,
                          ),
                          const SizedBox(height: 14),
                          AureaTextField(
                            label: 'Product Name',
                            hint: 'e.g. Aurelia...',
                            controller: nameEn,
                          ),
                          const SizedBox(height: 14),
                          AureaTextField(
                            label: 'Product Name (Arabic)',
                            hint: 'اسم المنتج',
                            controller: nameAr,
                            rtl: true,
                          ),
                          const SizedBox(height: 14),
                          AureaTextField(
                            label: 'Price (SAR)',
                            hint: '0.00',
                            controller: price,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            suffix: 'SAR',
                          ),
                          const SizedBox(height: 14),
                          AureaTextField(
                            label: 'Stock',
                            hint: '1',
                            controller: stock,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 14),
                          AureaTextField(
                            label: 'Color',
                            hint: 'e.g. 18K Yellow Gold',
                            controller: color,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: 'Product Narrative',
                      child: Column(
                        children: [
                          AureaTextArea(
                            label: 'Description',
                            hint: 'Describe the craftsmanship...',
                            controller: descEn,
                          ),
                          const SizedBox(height: 14),
                          AureaTextArea(
                            label: 'Description (Arabic)',
                            hint: 'وصف المنتج...',
                            controller: descAr,
                            rtl: true,
                          ),
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
                          foregroundColor: isDark
                              ? AppColors.darkBackground
                              : AppColors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          'Save Product',
                          style: AppTextStyles.buttonText.copyWith(
                            color: isDark
                                ? AppColors.darkBackground
                                : AppColors.white,
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
