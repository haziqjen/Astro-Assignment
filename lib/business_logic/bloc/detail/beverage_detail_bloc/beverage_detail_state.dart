part of 'beverage_detail_bloc.dart';

abstract class BeverageDetailState extends Equatable {
  const BeverageDetailState();
}

class BeverageDetailInitial extends BeverageDetailState {
  @override
  List<Object> get props => [];
}

class DetailBeverageLoadingState extends BeverageDetailInitial{

}

class DetailBeverageSuccessState extends BeverageDetailInitial{

  final BeverageDetailModel beverageDetailModel;

  DetailBeverageSuccessState({required this.beverageDetailModel});

}

class DetailBeverageFailState extends BeverageDetailInitial{

  final String message;

  DetailBeverageFailState({required this.message});
}
