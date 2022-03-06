part of 'beverage_list_bloc.dart';

abstract class BeverageListEvent extends Equatable {
  const BeverageListEvent();
}

class FetchBeverageMenu extends BeverageListEvent {

  late String category;
  FetchBeverageMenu({required this.category});

  @override
  List<Object?> get props => [category];
}
