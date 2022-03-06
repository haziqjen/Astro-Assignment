import 'dart:async';

import 'package:astro_assignment_project/data/models/menu/food_menu_model.dart';
import 'package:astro_assignment_project/data/repositories/menu/menu_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_list_event.dart';
part 'food_list_state.dart';

class FoodListBloc extends Bloc<FoodListEvent, FoodListState> {
  MenuRepository menuRepository;
  FoodListBloc({required this.menuRepository}) : super(FoodListInitial()) {
    on<FetchFoodMenu>(_onFetchFoodMenu);
  }
    Future<void> _onFetchFoodMenu(FetchFoodMenu event, Emitter<FoodListState> emitter) async{

      emit(FoodMenuLoadingState());
      try{
        FoodMenuModel? foodMenuModel = await menuRepository.getFoodMenuModel(event.category);
        emit(FoodMenuSuccessState(foodMenuModel: foodMenuModel!));
      }catch (e){
        emit(FoodMenuFailState(message: e.toString()));
      }

  }
}
