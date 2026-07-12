import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/core/theme/themes.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/cubits/categories_cubit.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/cubits/categories_state.dart';

class ExploreListView extends StatelessWidget {
  const ExploreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if(state is CategoriesLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is CategoriesFailureState){
          return Center(child: Text("Something went wrong"),);
        }
        else if (state is CategoriesSuccessState){
        return ListView.builder(
          itemCount: state.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = state.categories[index];
            return Padding(
              padding: const EdgeInsets.only(right: 24),
              child: InkWell(
                child: Column(
                  spacing: 12,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.darkText, width: 2),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(category.coverPictureUrl),
                        radius: 35,
                      ),
                    ),

                    Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );}
        else{
        return SizedBox.shrink();}
      }
    );
  }
}
