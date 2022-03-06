part of 'food_list_bloc.dart';

abstract class FoodListEvent extends Equatable {
  const FoodListEvent();
}

class FetchFoodMenu extends FoodListEvent {

  late String category;
  FetchFoodMenu({required this.category});

  @override
  List<Object?> get props => [category];
}