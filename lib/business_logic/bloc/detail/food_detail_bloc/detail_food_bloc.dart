import 'dart:async';

import 'package:astro_assignment_project/data/models/detail/food_detail_model.dart';
import 'package:astro_assignment_project/data/repositories/detail/detail_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_food_event.dart';
part 'detail_food_state.dart';

class DetailFoodBloc extends Bloc<DetailFoodEvent, DetailFoodState> {
  DetailRepository detailRepository;
  DetailFoodBloc({required this.detailRepository}) : super(DetailFoodInitial()) {
    on<FetchDetailFoodEvent>(_onFetchDetailFood);
  }

  Future<void> _onFetchDetailFood(FetchDetailFoodEvent event, Emitter<DetailFoodState> emitter) async{

    emit(DetailFoodLoadingState());
    try{
      FoodDetailModel? foodDetailModel = await detailRepository.getFoodDetailModel(event.id);
      emit(DetailFoodSuccessState(foodDetailModel: foodDetailModel!));
    }catch (e){
      emit(DetailFoodFailState(message: e.toString()));
    }
  }
}
