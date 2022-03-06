part of 'food_category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class FoodCategoryLoadingState extends CategoryInitial{

}

class FoodCategorySuccessState extends CategoryInitial{

  final FoodCategoryModel categoryModel;

  FoodCategorySuccessState({required this.categoryModel});

}

class FoodCategoryFailState extends CategoryInitial{

  final String message;

  FoodCategoryFailState({required this.message});
}



