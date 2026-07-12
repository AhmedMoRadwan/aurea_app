import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce_team4/features/home/data/date_source/offers_data_source.dart';
import 'package:nti_ecommerce_team4/features/home/presentation/cubits/offers_cubit/offers_states.dart';

class OffersCubit extends Cubit<OffersStates>{
  OffersCubit():super(OffersInitialState());

  final OffersDataSource remoteDataSource = OffersDataSource();


 Future<void> getOffers() async{
    emit(OffersLoadingState());
    try {
      final offers =await remoteDataSource.getOffer();
      emit(OffersSuccessState(offers: offers));
    } catch (e) {
      emit(OffersFailiurState());
    }
  }
}