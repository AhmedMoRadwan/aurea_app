
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../widgets/buy_now_button.dart';
import '../widgets/expandabe_description.dart';
import '../widgets/fraction_clipper.dart';
import '../widgets/hero_caroasal.dart';
import '../widgets/price_row.dart';
import '../widgets/quantity_stipper.dart';
import '../widgets/rating_row.dart';
import '../widgets/related_rail.dart';
import '../widgets/section_label.dart';
import '../widgets/title_row.dart';

/// Reaches the AppColors slots ThemeData's ColorScheme/TextTheme don't have
/// a direct home for: surfaceAlt, the muted gold-tinted label color, and a
/// darker/paler gold derived from AppColors.gold for accents.
extension AureaThemeX on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Color get surfaceAlt =>
      isDark ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt;

  Color get textMuted =>
      isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;

  Color get borderColor => Theme.of(this).colorScheme.outline;

  Color get textPrimary => Theme.of(this).colorScheme.onSurface;

  Color get textSecondary =>
      Theme.of(this).textTheme.bodyMedium?.color ??
      AppColors.lightTextSecondary;

  Color get cardColor => Theme.of(this).colorScheme.surface;

  Color get gold => AppColors.gold;

  Color get errorColor => Theme.of(this).colorScheme.error;

  /// Text that sits on top of a solid gold fill (badges, the cart button).
  Color get onGold => AppColors.gold;

  Color get goldDeep {
    final hsl = HSLColor.fromColor(AppColors.gold);
    return hsl.withLightness((hsl.lightness - 0.14).clamp(0.0, 1.0)).toColor();
  }

  Color get goldPale {
    final hsl = HSLColor.fromColor(AppColors.gold);
    return hsl.withLightness((hsl.lightness + 0.28).clamp(0.0, 1.0)).toColor();
  }

  Color get success => AppColors.success;

  Color get successBg => AppColors.success.withOpacity(isDark ? 0.18 : 0.12);
}

const heroImages = [
  'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?q=80&w=900&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1617038260897-41a1f14a8ca0?q=80&w=900&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?q=80&w=900&auto=format&fit=crop',
];

class RelatedItem {
  final String name;
  final String price;
  final String image;

  const RelatedItem(this.name, this.price, this.image);
}

const relatedItems = [
  RelatedItem(
    'Baguette Ring',
    '\$1,250',
    'https://images.unsplash.com/photo-1605100804763-247f67b3557e?q=80&w=500&auto=format&fit=crop',
  ),
  RelatedItem(
    'Teardrop Studs',
    '\$2,100',
    'https://images.unsplash.com/photo-1620656798579-1984d9e87df7?q=80&w=500&auto=format&fit=crop',
  ),
  RelatedItem(
    'Halo Bracelet',
    '\$3,050',
    'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?q=80&w=500&auto=format&fit=crop',
  ),
];

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int bagCount = 0;
  String? toastMessage;
  Timer? _toastTimer;
  int qty = 1;

  void showToast(String msg) {
    _toastTimer?.cancel();
    setState(() => toastMessage = msg);
    _toastTimer = Timer(const Duration(milliseconds: 1800), () {
      if (mounted) setState(() => toastMessage = null);
    });
  }

  void addToBag(int n, String msg) {
    setState(() => bagCount += n);
    showToast(msg);
  }

  void removeOneFromBag() {
    setState(() => bagCount = (bagCount - 1).clamp(0, 999));
  }

  @override
  void dispose() {
    _toastTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: context.cardColor,
                  borderRadius: BorderRadius.circular(34),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                        context.isDark ? 0.55 : 0.18,
                      ),
                      blurRadius: 45,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeroCarousel(
                        bagCount: bagCount,
                        onBack: () => showToast('Back to catalog'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleRow(),
                            const SizedBox(height: 10),
                            const RatingRow(),
                            const SizedBox(height: 16),
                            const PriceRow(),
                            const ChainDivider(),
                            const SectionLabel(
                              icon: Icons.notes_rounded,
                              label: 'Description',
                            ),
                            const SizedBox(height: 10),
                            const ExpandableDescription(),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: BuyNowButton(
                                    onTap: () =>
                                        showToast('Proceeding to checkout…'),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: AddToCartButton(
                                    onAdded: () => addToBag(
                                      qty,
                                      'Added $qty item${qty > 1 ? 's' : ''} to cart',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 22),
                            const SpecsAccordion(),
                            const SizedBox(height: 22),
                            QuantityStepper(
                              value: qty,
                              onChanged: (v) => setState(() => qty = v),
                            ),
                            const SizedBox(height: 26),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SectionLabel(
                                  icon: Icons.favorite_border_rounded,
                                  label: 'Complete the Set',
                                ),
                                Text(
                                  'View All →',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: context.goldDeep,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.5,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                      RelatedRail(
                        onQuickAdd: (name) => addToBag(1, '$name added'),
                        onQuickRemove: removeOneFromBag,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              // Toast overlay
              Positioned(
                left: 0,
                right: 0,
                bottom: 34,
                child: Center(
                  child: AnimatedSlide(
                    duration: const Duration(milliseconds: 260),
                    curve: Curves.easeOutBack,
                    offset: toastMessage == null
                        ? const Offset(0, 0.4)
                        : Offset.zero,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 220),
                      opacity: toastMessage == null ? 0 : 1,
                      child: IgnorePointer(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: context.isDark
                                ? AppColors.darkSurfaceAlt
                                : AppColors.lightTextPrimary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            toastMessage ?? '',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: context.isDark
                                      ? AppColors.darkTextPrimary
                                      : Colors.white,
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating; // e.g. 4.9
  final double size;

  const StarRating({super.key, required this.rating, this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (i) {
        final fill = (rating - i).clamp(0, 1).toDouble();
        return Padding(
          padding: const EdgeInsets.only(right: 2),
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              children: [
                Icon(
                  Icons.star_rounded,
                  size: size,
                  color: context.borderColor,
                ),
                ClipRect(
                  clipper: FractionClipper(fill),
                  child: Icon(
                    Icons.star_rounded,
                    size: size,
                    color: context.gold,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class ChainDivider extends StatelessWidget {
  const ChainDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: SizedBox(
        height: 14,
        width: double.infinity,
        child: CustomPaint(
          painter: _ChainPainter(
            lineColor: context.borderColor,
            dotColor: context.gold,
          ),
        ),
      ),
    );
  }
}

class _ChainPainter extends CustomPainter {
  final Color lineColor;
  final Color dotColor;

  _ChainPainter({required this.lineColor, required this.dotColor});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      linePaint,
    );

    final dotPaint = Paint()
      ..color = dotColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    const spacing = 14.0;
    final count = (size.width / spacing).floor();
    for (int i = 0; i < count; i++) {
      canvas.drawCircle(
        Offset(10 + i * spacing, size.height / 2),
        3.4,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ChainPainter oldDelegate) =>
      oldDelegate.lineColor != lineColor || oldDelegate.dotColor != dotColor;
}

class AddToCartButton extends StatefulWidget {
  final VoidCallback onAdded;

  const AddToCartButton({super.key, required this.onAdded});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool added = false;

  void _tap() {
    if (added) return;
    setState(() => added = true);
    widget.onAdded();
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (mounted) setState(() => added = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: _tap,
        style: ElevatedButton.styleFrom(
          backgroundColor: added ? context.success : context.gold,
          foregroundColor: added ? AppColors.white : context.onGold,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: Icon(
                added ? Icons.check_rounded : Icons.shopping_bag_outlined,
                key: ValueKey(added),
                size: 17,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              added ? 'Added' : 'Add to Cart',
              style: AppTextStyles.buttonText.copyWith(
                color: AppColors.white,
                fontSize: 14.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecsAccordion extends StatefulWidget {
  const SpecsAccordion({super.key});

  @override
  State<SpecsAccordion> createState() => _SpecsAccordionState();
}

class _SpecsAccordionState extends State<SpecsAccordion> {
  bool open = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => open = !open),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              color: context.surfaceAlt,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SectionLabel(
                    icon: Icons.diamond_outlined,
                    label: 'Specifications',
                  ),
                  AnimatedRotation(
                    turns: open ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                      color: context.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOut,
            child: SizedBox(
              height: open ? null : 0,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: _SpecsGrid(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecsGrid extends StatelessWidget {
  const _SpecsGrid();

  @override
  Widget build(BuildContext context) {
    Widget item(String k, String v, {bool accent = false}) => Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            k.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 11,
              letterSpacing: 0.6,
              color: context.textSecondary,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            v,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: accent ? context.success : context.textPrimary,
            ),
          ),
        ],
      ),
    );
    return Column(
      children: [
        Row(
          children: [
            item('Material', '18K Solid Gold'),
            item('Weight', '4.2g'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            item('Availability', 'In Stock', accent: true),
            item('SKU', 'AU-882'),
          ],
        ),
      ],
    );
  }
}
