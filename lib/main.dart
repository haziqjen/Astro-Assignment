import 'package:astro_assignment_project/business_logic/bloc/category/beverage_category_bloc/beverage_category_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/category/food_category_bloc/food_category_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/detail/beverage_detail_bloc/beverage_detail_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/detail/food_detail_bloc/detail_food_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/detail/ingredient_counter_cubit/ingredient_counter_cubit.dart';
import 'package:astro_assignment_project/business_logic/bloc/menu/beverage_list_bloc/beverage_list_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/menu/food_list_bloc/food_list_bloc.dart';
import 'package:astro_assignment_project/constants/theme_data.dart';
import 'package:astro_assignment_project/data/repositories/category/category_repository.dart';
import 'package:astro_assignment_project/data/repositories/detail/detail_repository.dart';
import 'package:astro_assignment_project/data/repositories/menu/menu_repository.dart';
import 'package:astro_assignment_project/presentation/router/app_router.dart';
import 'package:astro_assignment_project/presentation/screens/initial_screen/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                FoodCategoryBloc(categoryRepository: CategoryRepository())
                  ..add(FetchFoodCategoryEvent())),
        BlocProvider(
            create: (_) =>
            BeverageCategoryBloc(categoryRepository: CategoryRepository())
              ..add(FetchBeverageCategoryEvent())),
        BlocProvider(
            create: (_) => FoodListBloc(menuRepository: MenuRepository())),
        BlocProvider(
            create: (_) => BeverageListBloc(menuRepository: MenuRepository())),
        BlocProvider(
            create: (_) => DetailFoodBloc(detailRepository: DetailRepository())),
        BlocProvider(
            create: (_) => BeverageDetailBloc(detailRepository: DetailRepository())),
        BlocProvider(create: (_) => IngredientCounterCubit()),
      ],
      child: MaterialApp(
        title: 'Astro Assignment',
        theme: AppTheme.light,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: InitialScreen.routeName,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
