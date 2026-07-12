import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/cubits/categories_cubit.dart';
import 'package:nti_ecommerce_team4/features/categories/presentation/cubits/categories_state.dart';

class CollectionsGridView extends StatelessWidget {
  const CollectionsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CategoriesFailureState) {
          return Center(child: Text("Something went wrong"));
        } else if (state is CategoriesSuccessState) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.75,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return Card(
                // color: Color(0xffFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  // side: BorderSide(color: Color(0xffF6EFDD))
                ),

                // elevation: 0.1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {},

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: category.coverPictureUrl.trim().isNotEmpty
                                ? Image.network(
                                    category.coverPictureUrl,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/images/beso.jpg",
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      );
                                    },
                                  )
                                : Image.asset(
                                    "assets/images/beso.jpg",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                          ),
                        ),
                        SizedBox(height: 15),

                        Text(
                          category.name,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 158, 125, 16),
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
