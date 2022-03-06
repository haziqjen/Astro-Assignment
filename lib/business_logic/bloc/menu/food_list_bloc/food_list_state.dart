part of 'food_list_bloc.dart';

abstract class FoodListState extends Equatable {
  const FoodListState();
}

class FoodListInitial extends FoodListState {
  @override
  List<Object> get props => [];
}

class FoodMenuLoadingState extends FoodListInitial{

}

class FoodMenuSuccessState extends FoodListInitial{

  final FoodMenuModel foodMenuModel;

  FoodMenuSuccessState({required this.foodMenuModel});

}

class FoodMenuFailState extends FoodListInitial {

  final String message;

  FoodMenuFailState({required this.message});
}
