part of 'detail_food_bloc.dart';

abstract class DetailFoodState extends Equatable {
  const DetailFoodState();
}

class DetailFoodInitial extends DetailFoodState {
  @override
  List<Object> get props => [];
}


class DetailFoodLoadingState extends DetailFoodInitial{

}

class DetailFoodSuccessState extends DetailFoodInitial{

  final FoodDetailModel foodDetailModel;

  DetailFoodSuccessState({required this.foodDetailModel});

}

class DetailFoodFailState extends DetailFoodInitial{

  final String message;

  DetailFoodFailState({required this.message});
}
