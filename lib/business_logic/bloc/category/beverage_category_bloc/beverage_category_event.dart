part of 'beverage_category_bloc.dart';

abstract class BeverageCategoryEvent extends Equatable {
  const BeverageCategoryEvent();
}

class FetchBeverageCategoryEvent extends BeverageCategoryEvent {
  @override
  List<Object?> get props => [];
}
