part of 'beverage_detail_bloc.dart';

abstract class BeverageDetailEvent extends Equatable {
  const BeverageDetailEvent();
}

class FetchDetailBeverageEvent extends BeverageDetailEvent {
  final String id;

  const FetchDetailBeverageEvent({required this.id});
  @override
  List<Object?> get props => [id];
}