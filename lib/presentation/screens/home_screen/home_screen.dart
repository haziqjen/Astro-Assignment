import 'package:astro_assignment_project/business_logic/bloc/category/beverage_category_bloc/beverage_category_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/category/food_category_bloc/food_category_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/menu/beverage_list_bloc/beverage_list_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/menu/food_list_bloc/food_list_bloc.dart';
import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/data/models/category/food_category_model.dart';
import 'package:astro_assignment_project/data/repositories/category/category_repository.dart';
import 'package:astro_assignment_project/presentation/screens/detail_screen/detail_screen.dart';
import 'package:astro_assignment_project/presentation/screens/home_screen/components/beverage_category_list.dart';
import 'package:astro_assignment_project/presentation/screens/home_screen/components/category_list_card.dart';
import 'package:astro_assignment_project/presentation/screens/home_screen/components/location_dropdown.dart';
import 'package:astro_assignment_project/presentation/screens/home_screen/components/menu_card.dart';
import 'package:astro_assignment_project/presentation/screens/home_screen/components/shimmer_category_list.dart';
import 'package:astro_assignment_project/presentation/screens/home_screen/components/shimmer_menu_card.dart';
import 'package:astro_assignment_project/presentation/widgets/header.dart';
import 'package:astro_assignment_project/presentation/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../router/route_names.dart';

class HomeScreen extends StatelessWidget {
  final bool isFood;

  const HomeScreen({Key? key, required this.isFood}) : super(key: key);

  static const String routeName = RouteName.HOME_SCREEN;

  static Route route({required bool isFood}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => HomeScreen(isFood: isFood),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("xxxx isfood $isFood");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          HeaderSection(
            title: 'Good morning, Haziq!',
          ),
          LocationSection(),
          SizedBox(
            height: 20,
          ),
          SearchTextField(),
          SizedBox(
            height: 20,
          ),
          isFood
              ? BlocBuilder<FoodCategoryBloc, CategoryState>(
                  builder: (context, state) {
                  if (state is FoodCategoryLoadingState) {
                    return const ShimmerCategoryList();
                  } else if (state is FoodCategorySuccessState) {
                    context.read<FoodListBloc>().add(FetchFoodMenu(
                        category:
                            state.categoryModel.categories.first.strCategory));
                    return CategoryListCard(
                      categoryModel: state.categoryModel,
                    );
                  } else if (state is FoodCategoryFailState) {
                    return Text(state.message);
                  }
                  return Container();
                })
              : BlocBuilder<BeverageCategoryBloc, BeverageCategoryState>(
                  builder: (context, state) {
                  if (state is BeverageCategoryLoadingState) {
                    return const ShimmerCategoryList();
                  } else if (state is BeverageCategorySuccessState) {
                    context.read<BeverageListBloc>().add(FetchBeverageMenu(
                        category:
                            state.categoryModel.drinks.first.strCategory));
                    return BeverageCategoryCard(categoryModel: state.categoryModel);
                  } else if (state is BeverageCategoryFailState) {
                    return Text(state.message);
                  }
                  return Container();
                }),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                isFood ? 'Popular Food' : 'Popular Beverage',
                style: GoogleFonts.montserrat(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          isFood
              ? BlocBuilder<FoodListBloc, FoodListState>(
                  builder: (context, state) {
                  if (state is FoodMenuLoadingState) return ShimmerMenuCard();
                  if (state is FoodMenuSuccessState) {
                    return Column(
                      children: [
                        ...state.foodMenuModel.meals.map((e) {
                          return MenuCard(
                              imgUrl: e.strMealThumb,
                              name: e.strMeal,
                              id: e.idMeal,
                              isFood: true);
                        }).toList()
                      ],
                    );
                  }

                  return const ShimmerMenuCard();
                })
              : BlocBuilder<BeverageListBloc, BeverageListState>(
                  builder: (context, state) {
                  if (state is BeverageMenuLoadingState) {
                    return const ShimmerMenuCard();
                  }
                  if (state is BeverageMenuSuccessState) {
                    return Column(
                      children: [
                        ...state.beverageMenuModel.drinks.map((e) {
                          return MenuCard(
                            imgUrl: e.strDrinkThumb,
                            name: e.strDrink,
                            id: e.idDrink,
                            isFood: false,
                          );
                        }).toList()
                      ],
                    );
                  }

                  if (state is BeverageMenuFailState) {
                    return Center(
                        child: Text(
                      'Something went wrong',
                      style: GoogleFonts.montserrat(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    color: Colors.black,
                      ),
                    ));
                  }

                  return const ShimmerMenuCard();
                }),
        ]),
      ),
    ));
  }
}
