import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/cubits/offers_cubit/offers_states.dart';

class OfferSection extends StatelessWidget {
  const OfferSection({super.key,required this.onShopNow});
  final VoidCallback onShopNow;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersStates>(
      builder: (context, state) {
        if (state is OffersLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is OffersFailiurState) {
          return Center(child: Text("Something went wrong"));
        } else if (state is OffersSuccessState) {
          final offer = state.offers.first;
          log(offer.coverul);
          return CarouselSlider(
            items: state.offers.map((offer) {
              return SizedBox(
                height: 300,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.network(
                      offer.coverul,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      // height: 300,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/beso.jpg",
                          width: double.infinity,
                          // height: 300,
                          fit: BoxFit.cover,
                        );
                      },
                    ),

                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black54, Colors.transparent],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 65),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            offer.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.4,
                              color: Color(0xffFFFFFF),
                              fontFamily: 'Inter',
                            ),
                          ),

                          Text(
                            offer.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.96,
                              color: Color(0xffFFFFFF),
                              fontFamily: 'PlayfairDisplay',
                            ),
                          ),

                          SizedBox(height: 5),

                          ElevatedButton(
                            onPressed: onShopNow,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffD4AF37),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                            ),
                            child: Text(
                              'Shop Now',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0,
                                color: Color(0xff554300),
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              enlargeCenterPage: false,

              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 1200),
              viewportFraction: 1,
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollPhysics: BouncingScrollPhysics(),
              enableInfiniteScroll: true,
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
