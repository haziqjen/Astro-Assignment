import 'dart:async';

import 'package:astro_assignment_project/data/models/detail/beverage_detail_model.dart';
import 'package:astro_assignment_project/data/repositories/detail/detail_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'beverage_detail_event.dart';
part 'beverage_detail_state.dart';

class BeverageDetailBloc extends Bloc<BeverageDetailEvent, BeverageDetailState> {
  final DetailRepository detailRepository;
  BeverageDetailBloc({required this.detailRepository}) : super(BeverageDetailInitial()) {
    on<FetchDetailBeverageEvent>(_onFetchDetailBeverage);
  }

  Future<void> _onFetchDetailBeverage(FetchDetailBeverageEvent event, Emitter<BeverageDetailState> emitter) async{

    emit(DetailBeverageLoadingState());
    try{
      BeverageDetailModel? beverageDetailModel = await detailRepository.getBeverageDetailModel(event.id);
      emit(DetailBeverageSuccessState(beverageDetailModel: beverageDetailModel!));
    }catch (e){
      emit(DetailBeverageFailState(message: e.toString()));
    }
  }
}
