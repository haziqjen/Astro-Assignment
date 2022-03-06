import 'dart:async';

import 'package:astro_assignment_project/data/models/menu/beverage_menu_model.dart';
import 'package:astro_assignment_project/data/repositories/menu/menu_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'beverage_list_event.dart';

part 'beverage_list_state.dart';

class BeverageListBloc extends Bloc<BeverageListEvent, BeverageListState> {
  MenuRepository menuRepository;

  BeverageListBloc({required this.menuRepository})
      : super(BeverageListInitial()) {
    on<FetchBeverageMenu>(_onFetchBeverageMenu);
  }

  Future<void> _onFetchBeverageMenu(
      FetchBeverageMenu event, Emitter<BeverageListState> emitter) async {
    emit(BeverageMenuLoadingState());
    try {
      BeverageMenuModel? beverageMenuModel =
          await menuRepository.getBeverageMenuModel(event.category);
      emit(BeverageMenuSuccessState(beverageMenuModel: beverageMenuModel!));
    } catch (e) {
      emit(BeverageMenuFailState(message: e.toString()));
    }
  }
}
