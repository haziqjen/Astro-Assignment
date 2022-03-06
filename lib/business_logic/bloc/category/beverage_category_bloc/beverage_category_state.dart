part of 'beverage_category_bloc.dart';

abstract class BeverageCategoryState extends Equatable {
  const BeverageCategoryState();
}

class BeverageCategoryInitial extends BeverageCategoryState {
  @override
  List<Object> get props => [];
}


class BeverageCategoryLoadingState extends BeverageCategoryInitial{

}

class BeverageCategorySuccessState extends BeverageCategoryInitial{

  final BeverageCategoryModel categoryModel;

  BeverageCategorySuccessState({required this.categoryModel});

}

class BeverageCategoryFailState extends BeverageCategoryInitial{

  final String message;

  BeverageCategoryFailState({required this.message});
}

