import 'package:astro_assignment_project/business_logic/bloc/category/beverage_category_bloc/beverage_category_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/category/food_category_bloc/food_category_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/menu/beverage_list_bloc/beverage_list_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/menu/food_list_bloc/food_list_bloc.dart';
import 'package:astro_assignment_project/data/models/category/beverage_category_model.dart';
import 'package:astro_assignment_project/data/models/category/food_category_model.dart';
import 'package:astro_assignment_project/data/models/menu/beverage_menu_model.dart';
import 'package:astro_assignment_project/data/models/menu/food_menu_model.dart';
import 'package:astro_assignment_project/data/repositories/category/category_repository.dart';
import 'package:astro_assignment_project/data/repositories/menu/menu_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMenuRepository extends Mock implements MenuRepository {}

void main() {
  late MenuRepository menuRepository;
  late FoodListBloc foodListBloc;
  late BeverageListBloc beverageListBloc;
  late FoodMenuModel foodMenuModel;
  late BeverageMenuModel beverageMenuModel;
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    menuRepository = MockMenuRepository();
    foodListBloc = FoodListBloc(menuRepository: menuRepository);
    beverageListBloc =
        BeverageListBloc(menuRepository: menuRepository);
  });

  tearDown(() {
    foodListBloc.close();
    beverageListBloc.close();
  });

  /**
   * START OF FOOD MENU BLOC TEST
   */

  test('[FOOD MENU BLOC] Test initial state', () {
    expect(foodListBloc.state.runtimeType, FoodListInitial);
  });

  blocTest('[FOOD MENU] Test loading & success state when getting data from repository',
      build: () => foodListBloc,
      act: (FoodListBloc foodListBloc) {
        foodListBloc.add(FetchFoodMenu(category: 'Beef'));
        when(() => menuRepository.getFoodMenuModel('Beef'))
            .thenAnswer((invocation) async {
          foodMenuModel = foodMenuModelFromJson(
              await rootBundle.loadString('assets/seeders/food_menu.json'));
          return foodMenuModel;
        });
      },
      expect: () => [
            FoodMenuLoadingState(),
            FoodMenuSuccessState(foodMenuModel: foodMenuModel),
          ]);

  blocTest('[FOOD MENU] Test fail state when error getting from food repository',
      build: () => foodListBloc,
      act: (FoodListBloc foodListBloc) {
        foodListBloc.add(FetchFoodMenu(category: 'Beef'));
        when(() => menuRepository.getFoodMenuModel('Beef'))
            .thenAnswer((invocation) async {
          foodMenuModel = foodMenuModelFromJson(
              await rootBundle.loadString('assets/seeders/response_error.json'));
          return foodMenuModel;
        });
      },
      expect: () => [
        FoodMenuLoadingState(),
        FoodMenuFailState(message: 'Something went wrong'),
      ]);
  

  /**
   * END OF FOOD MENU BLOC TEST
   */


  /**
   * START OF BEVERAGE MENU BLOC TEST
   */


  test('[BEVERAGE MENU BLOC] Test initial state', () {
    expect(beverageListBloc.state.runtimeType, BeverageListInitial);
  });

  blocTest('[BEVERAGE MENU] Test loading & success state when getting data from repository',
      build: () => beverageListBloc,
      act: (BeverageListBloc beverageListBloc) {
        beverageListBloc.add(FetchBeverageMenu(category: 'Ordinary_Drink'));
        when(() => menuRepository.getBeverageMenuModel('Ordinary_Drink'))
            .thenAnswer((invocation) async {
          beverageMenuModel = beverageMenuModelFromJson(
              await rootBundle.loadString('assets/seeders/beverage_menu.json'));
          return beverageMenuModel;
        });
      },
      expect: () => [
        BeverageMenuLoadingState(),
        BeverageMenuSuccessState(beverageMenuModel: beverageMenuModel),
      ]);

  blocTest('[BEVERAGE MENU] Test fail state when error getting from food repository',
      build: () => beverageListBloc,
      act: (BeverageListBloc beverageListBloc) {
        beverageListBloc.add(FetchBeverageMenu(category: 'Ordinary_Drink'));
        when(() => menuRepository.getBeverageMenuModel('Ordinary_Drink'))
            .thenAnswer((invocation) async {
          beverageMenuModel = beverageMenuModelFromJson(
              await rootBundle.loadString('assets/seeders/response_error.json'));
          return beverageMenuModel;
        });
      },
      expect: () => [
        BeverageMenuLoadingState(),
        BeverageMenuFailState(message: 'Something wrong!'),
      ]);

  /**
   * END OF BEVERAGE CATEGORY BLOC TEST
   */

}
