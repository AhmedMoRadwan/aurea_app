import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/add_cart_button.dart';
import '../widgets/buy_now_button.dart';
import '../widgets/chain_divider.dart';
import '../widgets/expandabe_description.dart';
import '../widgets/hero_caroasal.dart';
import '../widgets/price_row.dart';
import '../widgets/quantity_stipper.dart';
import '../widgets/rating_row.dart';
import '../widgets/related_rail.dart';
import '../widgets/section_label.dart';
import '../widgets/specs_acordion.dart';
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
                        onBack: ()
                        {
                          Navigator.pop(context);
                        },
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
