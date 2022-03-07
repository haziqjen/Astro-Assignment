import 'package:astro_assignment_project/business_logic/bloc/category/beverage_category_bloc/beverage_category_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/category/food_category_bloc/food_category_bloc.dart';
import 'package:astro_assignment_project/data/models/category/beverage_category_model.dart';
import 'package:astro_assignment_project/data/models/category/food_category_model.dart';
import 'package:astro_assignment_project/data/repositories/category/category_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  late CategoryRepository categoryRepository;
  late FoodCategoryBloc foodCategoryBloc;
  late BeverageCategoryBloc beverageCategoryBloc;
  late FoodCategoryModel foodCategoryModel;
  late BeverageCategoryModel beverageCategoryModel;
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    categoryRepository = MockCategoryRepository();
    foodCategoryBloc = FoodCategoryBloc(categoryRepository: categoryRepository);
    beverageCategoryBloc =
        BeverageCategoryBloc(categoryRepository: categoryRepository);
  });

  tearDown(() {
    foodCategoryBloc.close();
    beverageCategoryBloc.close();
  });

  /**
   * START OF FOOD CATEGORY BLOC TEST
   */

  test('[FOOD CATEGORY BLOC] Test initial state', () {
    expect(foodCategoryBloc.state.runtimeType, CategoryInitial);
  });

  blocTest('[FOOD CATEGORY] Test loading & success state when getting data from repository',
      build: () => foodCategoryBloc,
      act: (FoodCategoryBloc foodCategoryBloc) {
        foodCategoryBloc.add(FetchFoodCategoryEvent());
        when(() => categoryRepository.getFoodCategoryModel())
            .thenAnswer((invocation) async {
          foodCategoryModel = categoryModelFromJson(
              await rootBundle.loadString('assets/seeders/food_category.json'));
          return foodCategoryModel;
        });
      },
      expect: () => [
            FoodCategoryLoadingState(),
            FoodCategorySuccessState(categoryModel: foodCategoryModel),
          ]);

  blocTest('[FOOD CATEGORY] Test fail state when error getting from food repository',
      build: () => foodCategoryBloc,
      act: (FoodCategoryBloc foodCategoryBloc) {
        foodCategoryBloc.add(FetchFoodCategoryEvent());
        when(() => categoryRepository.getFoodCategoryModel())
            .thenAnswer((invocation) async {
          foodCategoryModel = categoryModelFromJson(
              await rootBundle.loadString('assets/seeders/response_error.json'));
          return foodCategoryModel;
        });
      },
      expect: () => [
        FoodCategoryLoadingState(),
        FoodCategoryFailState(message: 'Something wrong!'),
      ]);

  /**
   * END OF FOOD CATEGORY BLOC TEST
   */


  /**
   * START OF BEVERAGE CATEGORY BLOC TEST
   */


  test('[BEVERAGE CATEGORY BLOC] Test initial state', () {
    expect(beverageCategoryBloc.state.runtimeType, BeverageCategoryInitial);
  });

  blocTest('[BEVERAGE CATEGORY] Test loading & success state when getting data from repository',
      build: () => beverageCategoryBloc,
      act: (BeverageCategoryBloc beverageCategoryBloc) {
        beverageCategoryBloc.add(FetchBeverageCategoryEvent());
        when(() => categoryRepository.getBeverageCategoryModel())
            .thenAnswer((invocation) async {
          beverageCategoryModel = beverageCategoryModelFromJson(
              await rootBundle.loadString('assets/seeders/beverage_category.json'));
          return beverageCategoryModel;
        });
      },
      expect: () => [
        BeverageCategoryLoadingState(),
        BeverageCategorySuccessState(categoryModel: beverageCategoryModel),
      ]);

  blocTest('[BEVERAGE CATEGORY] Test fail state when error getting from food repository',
      build: () => beverageCategoryBloc,
      act: (BeverageCategoryBloc beverageCategoryBloc) {
        beverageCategoryBloc.add(FetchBeverageCategoryEvent());
        when(() => categoryRepository.getBeverageCategoryModel())
            .thenAnswer((invocation) async {
          beverageCategoryModel = beverageCategoryModelFromJson(
              await rootBundle.loadString('assets/seeders/response_error.json'));
          return beverageCategoryModel;
        });
      },
      expect: () => [
        BeverageCategoryLoadingState(),
        BeverageCategoryFailState(message: 'Something wrong!'),
      ]);

  /**
   * END OF BEVERAGE CATEGORY BLOC TEST
   */

}
