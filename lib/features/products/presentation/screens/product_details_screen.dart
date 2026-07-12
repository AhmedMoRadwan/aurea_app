import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/features/cart/data/date_source/cart_remote_data_source.dart';
import 'package:nti_ecommerce_team4/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:nti_ecommerce_team4/features/cart/presentation/cubits/cart_state.dart';
import 'package:nti_ecommerce_team4/features/products/data/date_source/product_details_remote_data_source.dart';
import 'package:nti_ecommerce_team4/features/products/presentation/cubits/product_details_cubit.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/add_cart_button.dart';
import '../widgets/buy_now_button.dart';
import '../widgets/chain_divider.dart';
import '../widgets/expandabe_description.dart';
import '../widgets/hero_caroasal.dart';
import '../widgets/price_row.dart';
import '../widgets/quantity_stipper.dart';
import '../widgets/rating_row.dart';
import '../widgets/section_label.dart';
import '../widgets/specs_acordion.dart';
import '../widgets/start_rating.dart';
import '../widgets/title_row.dart';

extension AureaThemeX on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  Color get surfaceAlt => isDark ? AppColors.darkSurfaceAlt : AppColors.lightSurfaceAlt;
  Color get textMuted => isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;
  Color get borderColor => Theme.of(this).colorScheme.outline;
  Color get textPrimary => Theme.of(this).colorScheme.onSurface;
  Color get textSecondary => Theme.of(this).textTheme.bodyMedium?.color ?? AppColors.lightTextSecondary;
  Color get cardColor => Theme.of(this).colorScheme.surface;
  Color get gold => AppColors.gold;
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

class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductDetailsCubit(ProductDetailsRemoteDataSource())
            ..getProductDetails(widget.productId),
        ),
        BlocProvider(
          create: (context) => CartCubit(CartRemoteDataSource()),
        ),
      ],
      child: Scaffold(
        body: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is AddToCartSuccess) {
              showToast(state.message);
            } else if (state is CartError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              if (state is ProductDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductDetailsError) {
                return Center(child: Text(state.errorMessage));
              } else if (state is ProductDetailsSuccess) {
                final product = state.product;
                final reviews = state.reviews;
                
                // Construct gallery: Cover + Product Pictures
                final List<String> gallery = [product.coverPictureUrl];
                if (product.productPictures.isNotEmpty) {
                  gallery.addAll(product.productPictures);
                }

                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                          decoration: BoxDecoration(
                            color: context.cardColor,
                            borderRadius: BorderRadius.circular(34),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeroCarousel(
                                  bagCount: 0,
                                  images: gallery,
                                  onBack: () => Navigator.pop(context),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TitleRow(
                                        name: product.name,
                                        arabicName: product.arabicName,
                                      ),
                                      const SizedBox(height: 10),
                                      RatingRow(
                                        rating: product.rating.toDouble(),
                                        reviewsCount: product.reviewsCount,
                                      ),
                                      const SizedBox(height: 16),
                                      PriceRow(
                                        price: product.price.toDouble(),
                                        discountPercentage: product.discountPercentage,
                                      ),
                                      const ChainDivider(),
                                      const SectionLabel(icon: Icons.notes_rounded, label: 'Description'),
                                      const SizedBox(height: 10),
                                      ExpandableDescription(
                                        description: product.description,
                                        arabicDescription: product.arabicDescription,
                                      ),
                                      const SizedBox(height: 20),
                                      
                                      // BUTTONS LOGIC
                                      Builder(builder: (blocContext) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: BuyNowButton(onTap: () {
                                                blocContext.read<CartCubit>().addToCart(product.id, qty);
                                              }),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: BlocBuilder<CartCubit, CartState>(
                                                builder: (context, cartState) {
                                                  if (cartState is AddToCartLoading) {
                                                    return const Center(child: CircularProgressIndicator());
                                                  }
                                                  return AddToCartButton(
                                                    onAdded: () {
                                                      blocContext.read<CartCubit>().addToCart(product.id, qty);
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                      
                                      const SizedBox(height: 22),
                                      SpecsAccordion(product: product),
                                      const SizedBox(height: 22),
                                      QuantityStepper(value: qty, onChanged: (v) => setState(() => qty = v)),
                                      const SizedBox(height: 26),
                                      
                                      if (reviews.isNotEmpty) ...[
                                        const SectionLabel(icon: Icons.reviews_outlined, label: 'Customer Reviews'),
                                        const SizedBox(height: 12),
                                        ...reviews.take(3).map((review) => Padding(
                                          padding: const EdgeInsets.only(bottom: 12),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(review.userName, style: const TextStyle(fontWeight: FontWeight.w600)),
                                                  const Spacer(),
                                                  StarRating(rating: review.rating.toDouble(), size: 12),
                                                ],
                                              ),
                                              Text(review.comment, style: TextStyle(color: context.textSecondary, fontSize: 12)),
                                            ],
                                          ),
                                        )),
                                      ],
                                      const SizedBox(height: 12),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Toast UI
                        if (toastMessage != null)
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 34,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                                decoration: BoxDecoration(
                                  color: context.isDark ? AppColors.darkSurfaceAlt : AppColors.lightTextPrimary,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  toastMessage!,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: context.isDark ? AppColors.darkTextPrimary : Colors.white,
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
