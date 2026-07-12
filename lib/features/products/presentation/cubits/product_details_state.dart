part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {
  final ProductItem product;
  final List<ReviewItem> reviews;
  final List<ProductItem> relatedProducts;

  ProductDetailsSuccess({
    required this.product,
    required this.reviews,
    required this.relatedProducts,
  });
}

final class ProductDetailsError extends ProductDetailsState {
  final String errorMessage;

  ProductDetailsError({required this.errorMessage});
}
