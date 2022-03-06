import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/data/models/detail/beverage_detail_model.dart';
import 'package:astro_assignment_project/data/models/detail/food_detail_model.dart';
import 'package:astro_assignment_project/data/models/detail/ingredient_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientListView extends StatelessWidget {
  FoodDetailModel? foodDetailModel;
  BeverageDetailModel? beverageDetailModel;
  final bool isFood;
  final int counterState;

  IngredientListView(
      {Key? key,
      this.foodDetailModel,
      this.beverageDetailModel,
      required this.isFood, required this.counterState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ingredientList =
        IngredientList(isFood, foodDetailModel, beverageDetailModel);
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
          itemCount: ingredientList.getIngredientList().length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: size.width * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CachedNetworkImage(
                                  imageUrl: ingredientList
                                      .getIngredientList()[index]
                                      .img),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ingredientList
                                  .getIngredientList()[index]
                                  .ingredient,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              getIngredientMeasurement(ingredientList
                                  .getIngredientList()[index]
                                  .measurementNumber!, ingredientList
                                  .getIngredientList()[index]
                                  .measurement),
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: size.height * 0.016,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: ConstantValue.textLightColor,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  String getIngredientMeasurement(double value, String value2){

    String text =


    "" +
        (value
            .toString() ==
            "0.0"
            ? ""
            : (value*counterState).toFraction().toString() ) +
        value2
            .replaceAll(RegExp(r'[\d,/]'), '');

    return text;
  }
}
