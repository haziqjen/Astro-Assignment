import 'package:astro_assignment_project/business_logic/bloc/category/beverage_category_bloc/beverage_category_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/category/food_category_bloc/food_category_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/detail/beverage_detail_bloc/beverage_detail_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/detail/food_detail_bloc/detail_food_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/menu/beverage_list_bloc/beverage_list_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/menu/food_list_bloc/food_list_bloc.dart';
import 'package:astro_assignment_project/data/models/category/beverage_category_model.dart';
import 'package:astro_assignment_project/data/models/category/food_category_model.dart';
import 'package:astro_assignment_project/data/models/detail/beverage_detail_model.dart';
import 'package:astro_assignment_project/data/models/detail/food_detail_model.dart';
import 'package:astro_assignment_project/data/models/menu/beverage_menu_model.dart';
import 'package:astro_assignment_project/data/models/menu/food_menu_model.dart';
import 'package:astro_assignment_project/data/repositories/category/category_repository.dart';
import 'package:astro_assignment_project/data/repositories/detail/detail_repository.dart';
import 'package:astro_assignment_project/data/repositories/menu/menu_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDetailRepository extends Mock implements DetailRepository {}

void main() {
  late DetailRepository detailRepository;
  late DetailFoodBloc detailFoodBloc;
  late BeverageDetailBloc beverageDetailBloc;
  late FoodDetailModel foodDetailModel;
  late BeverageDetailModel beverageDetailModel;
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    detailRepository = MockDetailRepository();
    detailFoodBloc = DetailFoodBloc(detailRepository: detailRepository);
    beverageDetailBloc = BeverageDetailBloc(detailRepository: detailRepository);
  });

  tearDown(() {
    detailFoodBloc.close();
    beverageDetailBloc.close();
  });

  /**
   * START OF FOOD DETAIL BLOC TEST
   */

  test('[FOOD DETAIL BLOC] Test initial state', () {
    expect(detailFoodBloc.state.runtimeType, DetailFoodInitial);
  });

  blocTest(
      '[FOOD DETAIL] Test loading & success state when getting data from repository',
      build: () => detailFoodBloc,
      act: (DetailFoodBloc detailFoodBloc) {
        detailFoodBloc.add(FetchDetailFoodEvent(id: '52772'));
        when(() => detailRepository.getFoodDetailModel('52772'))
            .thenAnswer((invocation) async {
          foodDetailModel = foodDetailModelFromJson(
              await rootBundle.loadString('assets/seeders/food_detail.json'));
          return foodDetailModel;
        });
      },
      expect: () => [
            DetailFoodLoadingState(),
            DetailFoodSuccessState(foodDetailModel: foodDetailModel),
          ]);


  blocTest(
      '[FOOD DETAIL] Test fail state when error getting from food repository',
      build: () => detailFoodBloc,
      act: (DetailFoodBloc detailFoodBloc) {
        detailFoodBloc.add(FetchDetailFoodEvent(id: '52772'));
        when(() => detailRepository.getFoodDetailModel('52772'))
            .thenAnswer((invocation) async {
          foodDetailModel = foodDetailModelFromJson(
              await rootBundle.loadString('assets/seeders/response_error.json'));
          return foodDetailModel;
        });
      },
      expect: () => [
        DetailFoodLoadingState(),
        DetailFoodFailState(message: 'Something wrong!'),
      ]);


  /**
   * END OF FOOD DETAIL BLOC TEST
   */

  /**
   * START OF BEVERAGE DETAIL BLOC TEST
   */

  test('[BEVERAGE DETAIL BLOC] Test initial state', () {
    expect(beverageDetailBloc.state.runtimeType, BeverageDetailInitial);
  });

  blocTest(
      '[BEVERAGE DETAIL] Test loading & success state when getting data from repository',
      build: () => beverageDetailBloc,
      act: (BeverageDetailBloc beverageDetailBloc) {
        beverageDetailBloc.add(FetchDetailBeverageEvent(id: '11007'));
        when(() => detailRepository.getBeverageDetailModel('11007'))
            .thenAnswer((invocation) async {
          beverageDetailModel = beverageDetailModelFromJson(
              await rootBundle.loadString('assets/seeders/beverage_detail.json'));
          return beverageDetailModel;
        });
      },
      expect: () => [
            DetailBeverageLoadingState(),
        DetailBeverageSuccessState(beverageDetailModel: beverageDetailModel),
          ]);

  blocTest(
      '[BEVERAGE DETAIL] Test fail state when error getting from food repository',
      build: () => beverageDetailBloc,
      act: (BeverageDetailBloc beverageDetailBloc) {
        beverageDetailBloc.add(FetchDetailBeverageEvent(id: '11007'));
        when(() => detailRepository.getBeverageDetailModel('11007'))
            .thenAnswer((invocation) async {
          beverageDetailModel = beverageDetailModelFromJson(
              await rootBundle.loadString('assets/seeders/response_error.json'));
          return beverageDetailModel;
        });
      },
      expect: () => [
        DetailBeverageLoadingState(),
        DetailBeverageFailState(message: 'Something went wrong!'),
      ]);

  /**
   * END OF BEVERAGE CATEGORY BLOC TEST
   */
}
