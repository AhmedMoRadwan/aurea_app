import 'package:nti_ecommerce_team4/features/home/data/models/offers_model.dart';

abstract class OffersStates {}

class OffersInitialState extends OffersStates{}

class OffersLoadingState extends OffersStates{}

class OffersSuccessState extends OffersStates{
  final List<OffersModel> offers;

  OffersSuccessState({
    required this.offers,});
}

class OffersFailiurState extends OffersStates{}