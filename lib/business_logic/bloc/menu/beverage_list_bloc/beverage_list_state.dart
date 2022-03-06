part of 'beverage_list_bloc.dart';

abstract class BeverageListState extends Equatable {
  const BeverageListState();
}

class BeverageListInitial extends BeverageListState {
  @override
  List<Object> get props => [];
}

class BeverageMenuLoadingState extends BeverageListInitial{

}

class BeverageMenuSuccessState extends BeverageListInitial{

  final BeverageMenuModel beverageMenuModel;

  BeverageMenuSuccessState({required this.beverageMenuModel});

}

class BeverageMenuFailState extends BeverageListInitial {

  final String message;

  BeverageMenuFailState({required this.message});
}

