import 'dart:async';

import 'package:astro_assignment_project/data/models/category/beverage_category_model.dart';
import 'package:astro_assignment_project/data/models/category/food_category_model.dart';
import 'package:astro_assignment_project/data/repositories/category/category_repository.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'food_category_event.dart';

part 'food_category_state.dart';

class FoodCategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  CategoryRepository categoryRepository;
  FoodCategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
    on<FetchFoodCategoryEvent>(_onFetchFoodCategory);
  }

  Future<void> _onFetchFoodCategory(FetchFoodCategoryEvent event, Emitter<CategoryState> emitter) async{

    emit(FoodCategoryLoadingState());
    try{
      FoodCategoryModel? categoryModel = await categoryRepository.getFoodCategoryModel();
      emit(FoodCategorySuccessState(categoryModel: categoryModel!));
    }catch (e){
      emit(FoodCategoryFailState(message: e.toString()));
    }
  }




}
