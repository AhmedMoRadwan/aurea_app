import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/features/products/data/date_source/product_details_remote_data_source.dart';
import '../../data/models/product_model.dart';
import '../../data/models/review_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsCubit(this.productDetailsRemoteDataSource) : super(ProductDetailsInitial());

  Future<void> getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final product = await productDetailsRemoteDataSource.getProductDetails(productId);

      List<ReviewItem> reviews = [];
      try {
        final reviewResponse = await productDetailsRemoteDataSource.getReviews(productId);
        reviews = reviewResponse.reviews.items;
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching reviews: $e');
        }}
      
      emit(ProductDetailsSuccess(
        product: product,
        reviews: reviews,
        relatedProducts: [],
      ));
    } catch (e) {
      emit(ProductDetailsError(errorMessage: e.toString()));
    }
  }
}
