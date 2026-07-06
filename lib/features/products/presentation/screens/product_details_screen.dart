import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

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
  Color get onGold => AppColors.lightTextPrimary;

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


// Data
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

// Product page — owns bag count + toast, lays out phone-width card
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
                            const _TitleRow(),
                            const SizedBox(height: 10),
                            const _RatingRow(),
                            const SizedBox(height: 16),
                            const _PriceRow(),
                            const ChainDivider(),
                            const _SectionLabel(
                              icon: Icons.notes_rounded,
                              label: 'Description',
                            ),
                            const SizedBox(height: 10),
                            const ExpandableDescription(),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: _BuyNowButton(
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
                                const _SectionLabel(
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

// ---------------------------------------------------------------------------
// Hero carousel — swipeable images, top bar, dot pagination
// ---------------------------------------------------------------------------
class HeroCarousel extends StatefulWidget {
  final int bagCount;
  final VoidCallback onBack;

  const HeroCarousel({super.key, required this.bagCount, required this.onBack});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  final PageController _controller = PageController();
  int _page = 0;
  Timer? _auto;

  @override
  void initState() {
    super.initState();
    _auto = Timer.periodic(const Duration(seconds: 5), (_) {
      final next = (_page + 1) % heroImages.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _auto?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: heroImages.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (context, i) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(heroImages[i], fit: BoxFit.cover),
                  Container(
                    // Photo-overlay chrome — intentionally theme-independent,
                    // this sits on top of a photograph, not the UI surface.
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x59141210),
                          Color(0x00141210),
                          Color(0x00141210),
                          Color(0x8C141210),
                        ],
                        stops: [0.0, 0.3, 0.6, 1.0],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // top bar
          Positioned(
            top: 18,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _GlassIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: widget.onBack,
                ),
                Text(
                  'AUREA',
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    letterSpacing: 2,
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _GlassIconButton(
                      icon: Icons.shopping_bag_outlined,
                      onTap: () {},
                    ),
                    if (widget.bagCount > 0)
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          height: 16,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: context.gold,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${widget.bagCount}',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: context.onGold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          // dots
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(heroImages.length, (i) {
                final active = i == _page;
                return GestureDetector(
                  onTap: () => _controller.animateToPage(
                    i,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOut,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: active ? 18 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: active
                          ? context.goldPale
                          : Colors.white.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _GlassIconButton({required this.icon, required this.onTap});

  @override
  State<_GlassIconButton> createState() => _GlassIconButtonState();
}

class _GlassIconButtonState extends State<_GlassIconButton> {
  double _scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.88),
      onTapUp: (_) => setState(() => _scale = 1),
      onTapCancel: () => setState(() => _scale = 1),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 120),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.18)),
          ),
          child: Icon(widget.icon, color: AppColors.white, size: 18),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Title row + favorite button with a sparkle burst
// ---------------------------------------------------------------------------
class _TitleRow extends StatelessWidget {
  const _TitleRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ethereal Diamond\nNecklace',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 4),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'عقد الألماس الأثيري',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: context.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        const SparkleFavoriteButton(),
      ],
    );
  }
}

class SparkleFavoriteButton extends StatefulWidget {
  const SparkleFavoriteButton({super.key});

  @override
  State<SparkleFavoriteButton> createState() => _SparkleFavoriteButtonState();
}

class _SparkleFavoriteButtonState extends State<SparkleFavoriteButton>
    with SingleTickerProviderStateMixin {
  bool active = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => active = !active);
    if (active) {
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sparkColor = context.gold;
    final heartColor = context.errorColor;
    return GestureDetector(
      onTap: _toggle,
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) => CustomPaint(
                size: const Size(60, 60),
                painter: _SparklePainter(
                  progress: _controller.value,
                  color: sparkColor,
                ),
              ),
            ),
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: context.surfaceAlt,
                shape: BoxShape.circle,
                border: Border.all(color: context.borderColor),
              ),
              child: Icon(
                active ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: active ? heartColor : context.textSecondary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SparklePainter extends CustomPainter {
  final double progress; // 0..1
  final Color color;

  _SparklePainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0 || progress >= 1) return;
    final center = size.center(Offset.zero);
    final paint = Paint()
      ..color = color.withOpacity((1 - progress).clamp(0, 1));
    const count = 8;
    final dist = 14 + progress * 16;
    for (int i = 0; i < count; i++) {
      final angle = (2 * math.pi * i) / count;
      final p = center + Offset(math.cos(angle), math.sin(angle)) * dist;
      canvas.drawRect(
        Rect.fromCenter(center: p, width: 3.5, height: 3.5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _SparklePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}

// ---------------------------------------------------------------------------
// Rating row — fractional-fill star widget
// ---------------------------------------------------------------------------
class _RatingRow extends StatelessWidget {
  const _RatingRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const StarRating(rating: 4.9, size: 14),
        const SizedBox(width: 8),
        Text(
          '4.9',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: context.textPrimary,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '(120 reviews)',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12.5,
            color: context.textSecondary,
          ),
        ),
      ],
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
                  clipper: _FractionClipper(fill),
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

class _FractionClipper extends CustomClipper<Rect> {
  final double fraction;

  _FractionClipper(this.fraction);

  @override
  Rect getClip(Size size) =>
      Rect.fromLTWH(0, 0, size.width * fraction, size.height);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => true;
}

// ---------------------------------------------------------------------------
// Price row
// ---------------------------------------------------------------------------
class _PriceRow extends StatelessWidget {
  const _PriceRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '\$4,500',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 27,
            color: context.textPrimary,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '\$5,200',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 15,
            color: context.textSecondary,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(
            color: context.successBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Save 15%',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: context.success,
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Chain-link divider — signature element, echoes the necklace itself
// ---------------------------------------------------------------------------
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

// ---------------------------------------------------------------------------
// Section label
// ---------------------------------------------------------------------------
class _SectionLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SectionLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: context.gold),
        const SizedBox(width: 8),
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            color: context.textMuted,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Expandable bilingual description
// ---------------------------------------------------------------------------
class ExpandableDescription extends StatefulWidget {
  const ExpandableDescription({super.key});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool expanded = false;

  static const en =
      'Handcrafted with meticulous precision, the Ethereal Diamond Necklace features a brilliant-cut center stone suspended in a halo of ethically sourced pavé diamonds. A symbol of eternal grace and modern luxury. Each piece is finished by hand in our Cairo atelier and comes with a certificate of authenticity.';
  static const ar =
      'يتميز عقد الألماس الأثيري المصنوع يدويًا بدقة بحجر مركزي مبهر مقطوع بريليانت، محاط بهالة من الألماس المرصوف المستمد أخلاقيًا، رمزًا للأناقة الأبدية والرفاهية العصرية.';

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 13.8,
      height: 1.65,
      color: context.textSecondary,
    );
    final bodyStyleAr = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 13.3,
      height: 1.9,
      color: context.textSecondary,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: expanded ? 400 : 62),
            child: ClipRect(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(en, style: bodyStyle),
                  if (expanded) ...[
                    const SizedBox(height: 10),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(ar, style: bodyStyleAr),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                expanded ? 'Read less' : 'Read more',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: context.goldDeep,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.5,
                ),
              ),
              const SizedBox(width: 4),
              AnimatedRotation(
                turns: expanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 250),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: context.goldDeep,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Buy now / Add to cart buttons
// ---------------------------------------------------------------------------
class _BuyNowButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BuyNowButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bg = context.isDark
        ? AppColors.darkSurfaceAlt
        : AppColors.lightTextPrimary;
    final fg = context.isDark ? AppColors.darkTextPrimary : AppColors.white;
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          'Buy Now',
          style: AppTextStyles.buttonText.copyWith(fontSize: 14.5),
        ),
      ),
    );
  }
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
              style: AppTextStyles.buttonText.copyWith(fontSize: 14.5),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Specifications accordion
// ---------------------------------------------------------------------------
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
                  const _SectionLabel(
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

// ---------------------------------------------------------------------------
// Quantity stepper
// ---------------------------------------------------------------------------
class QuantityStepper extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const QuantityStepper({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget button(IconData icon, VoidCallback? onTap) => InkWell(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        color: context.surfaceAlt,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 16,
          color: onTap == null ? context.textSecondary : context.textPrimary,
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _SectionLabel(icon: Icons.add_box_outlined, label: 'Quantity'),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              button(
                Icons.remove_rounded,
                value > 1 ? () => onChanged(value - 1) : null,
              ),
              SizedBox(
                width: 38,
                child: Text(
                  '$value',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.5,
                    color: context.textPrimary,
                  ),
                ),
              ),
              button(Icons.add_rounded, () => onChanged(value + 1)),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Related products rail
// ---------------------------------------------------------------------------
class RelatedRail extends StatelessWidget {
  final void Function(String name) onQuickAdd;
  final VoidCallback onQuickRemove;

  const RelatedRail({
    super.key,
    required this.onQuickAdd,
    required this.onQuickRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: relatedItems.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final item = relatedItems[i];
          return _RelatedCard(
            item: item,
            onQuickAdd: onQuickAdd,
            onQuickRemove: onQuickRemove,
          );
        },
      ),
    );
  }
}

class _RelatedCard extends StatefulWidget {
  final RelatedItem item;
  final void Function(String name) onQuickAdd;
  final VoidCallback onQuickRemove;

  const _RelatedCard({
    required this.item,
    required this.onQuickAdd,
    required this.onQuickRemove,
  });

  @override
  State<_RelatedCard> createState() => _RelatedCardState();
}

class _RelatedCardState extends State<_RelatedCard> {
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      decoration: BoxDecoration(
        border: Border.all(color: context.borderColor),
        borderRadius: BorderRadius.circular(14),
        color: context.cardColor,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Image.network(widget.item.image, fit: BoxFit.cover),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() => added = !added);
                    if (added) {
                      widget.onQuickAdd(widget.item.name);
                    } else {
                      widget.onQuickRemove();
                    }
                  },
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: added
                          ? context.success
                          : Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Color(0x26000000), blurRadius: 6),
                      ],
                    ),
                    child: Icon(
                      added ? Icons.check_rounded : Icons.add_rounded,
                      size: 13,
                      color: added ? Colors.white : AppColors.lightTextPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 9, 10, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.2,
                    fontWeight: FontWeight.w600,
                    color: context.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.item.price,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: context.goldDeep,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
