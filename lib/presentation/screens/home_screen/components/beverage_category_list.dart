import 'package:astro_assignment_project/business_logic/bloc/menu/beverage_list_bloc/beverage_list_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/menu/food_list_bloc/food_list_bloc.dart';
import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/data/models/category/beverage_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BeverageCategoryCard extends StatelessWidget {
  final BeverageCategoryModel categoryModel;

  const BeverageCategoryCard(
      {Key? key, required this.categoryModel, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width * 0.2,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoryModel.drinks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: (){
                  context.read<BeverageListBloc>().add(FetchBeverageMenu(category: categoryModel.drinks[index].strCategory));
                },
                child: Chip(
                  backgroundColor: ConstantValue.primaryColor,
                  labelStyle: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.w600),
                  label: Text(categoryModel.drinks[index].strCategory),
                ),
              ),
            );
          }),
    );
  }
}
