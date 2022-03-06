part of 'detail_food_bloc.dart';

abstract class DetailFoodEvent extends Equatable {
  const DetailFoodEvent();
}

class FetchDetailFoodEvent extends DetailFoodEvent {
  final String id;

  const FetchDetailFoodEvent({required this.id});
  @override
  List<Object?> get props => [id];
}