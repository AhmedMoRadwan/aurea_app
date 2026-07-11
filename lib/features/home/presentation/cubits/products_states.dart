import 'package:nti_ecommerce_team4/features/home/data/models/products_model.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates{}

class ProductsLoadingState extends ProductsStates{}

class ProductsSuccessState extends ProductsStates{
  final List<ProductsModel> products;

  ProductsSuccessState({
    required this.products,});
}

class ProductsFailiurState extends ProductsStates{}