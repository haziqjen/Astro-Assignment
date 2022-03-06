part of 'food_category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class FetchFoodCategoryEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}
