import 'package:astro_assignment_project/business_logic/bloc/menu/food_list_bloc/food_list_bloc.dart';
import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/data/models/category/food_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryListCard extends StatefulWidget {
  final FoodCategoryModel categoryModel;

  const CategoryListCard({Key? key, required this.categoryModel})
      : super(key: key);

  @override
  _CategoryListCardState createState() => _CategoryListCardState();
}

class _CategoryListCardState extends State<CategoryListCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryModel.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => {
                context.read<FoodListBloc>().add(FetchFoodMenu(
                    category:
                        widget.categoryModel.categories[index].strCategory))
              },
              child: Container(
                width: size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.2,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // boxShadow: const [
                          //   BoxShadow(
                          //       blurRadius: 6,
                          //       color: Colors.grey,
                          //       spreadRadius: 0.5)
                          // ],
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.black38
                          image: DecorationImage(
                              image: NetworkImage(widget.categoryModel
                                  .categories[index].strCategoryThumb),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        widget.categoryModel.categories[index].strCategory,
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
