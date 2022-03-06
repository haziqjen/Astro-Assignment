import 'dart:async';

import 'package:astro_assignment_project/data/models/category/beverage_category_model.dart';
import 'package:astro_assignment_project/data/repositories/category/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'beverage_category_event.dart';
part 'beverage_category_state.dart';

class BeverageCategoryBloc extends Bloc<BeverageCategoryEvent, BeverageCategoryState> {
  CategoryRepository categoryRepository;
  BeverageCategoryBloc({required this.categoryRepository}) : super(BeverageCategoryInitial()) {
    on<FetchBeverageCategoryEvent>(_onFetchBeverageCategory);
  }

  Future<void> _onFetchBeverageCategory(FetchBeverageCategoryEvent event, Emitter<BeverageCategoryState> emitter) async{

    emit(BeverageCategoryLoadingState());
    try{
      BeverageCategoryModel? categoryModel = await categoryRepository.getBeverageCategoryModel();
      emit(BeverageCategorySuccessState(categoryModel: categoryModel!));
    }catch (e){
      emit(BeverageCategoryFailState(message: e.toString()));
    }
  }
}
