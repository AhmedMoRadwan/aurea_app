import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/features/categories/data/date_source/categories_data_source.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/cubits/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitialState());
  final CategoriesDataSource remoteDataSource = CategoriesDataSource();
  
  
  
  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    await remoteDataSource.getCategories().then(
      (val) {
        emit(CategoriesSuccessState(categories: val));
      },
      onError: (e) {
        log("Categories Error: $e");
        emit(CategoriesFailureState());
      },
    );
  }}