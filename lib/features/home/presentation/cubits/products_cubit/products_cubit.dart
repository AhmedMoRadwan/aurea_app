import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/features/home/data/date_source/products_data_source.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/cubits/products_cubit/products_states.dart';

class ProductsCubit extends Cubit<ProductsStates>{
  ProductsCubit():super(ProductsInitialState());

  final ProductsDataSource remoteDataSource = ProductsDataSource();


 Future<void> getProducts() async{
    emit(ProductsLoadingState());
    try {
      final products =await remoteDataSource.getProducts();
      emit(ProductsSuccessState(products: products));
    } catch (e) {
      emit(ProductsFailiurState());
    }
  }
}