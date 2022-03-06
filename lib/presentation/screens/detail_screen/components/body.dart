import 'dart:ui';

import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/data/models/detail/beverage_detail_model.dart';
import 'package:astro_assignment_project/data/models/detail/food_detail_model.dart';
import 'package:astro_assignment_project/presentation/screens/detail_screen/components/tab_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBody extends StatelessWidget {
  FoodDetailModel? foodDetailModel;
  BeverageDetailModel? beverageDetailModel;
  bool isFood;
  DetailBody({Key? key, this.foodDetailModel, this.beverageDetailModel, required this.isFood})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.38,
            child: Stack(
              children: [
                CachedNetworkImage(
                    width: size.width,
                    fit: BoxFit.fill,
                    imageUrl: getimageThumbUrl()
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.08),
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '4.5 ',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: size.height * 0.02,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '•',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey,
                                        fontSize: size.height * 0.03,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    ' 15.06',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: size.height * 0.02,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: size.height * (0.06),
                        ),
                        width: size.width * 0.12,
                        height: size.width * 0.12,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: ConstantValue.primaryColor,
                        ),
                        child: Icon(Icons.play_arrow, size: size.width * 0.08),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            margin: EdgeInsets.only(top: size.height * 0.35),
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            // height: 500,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.comment_outlined, size: size.width * 0.07),
                      SizedBox(width: 10),
                      Text('350', style: GoogleFonts.montserrat(
                        color: Colors.black, fontWeight: FontWeight.w400
                      ),),
                      Spacer(),
                      Icon(Icons.star_border_outlined, size: size.width * 0.07),
                      SizedBox(width: 10),
                      Icon(Icons.bookmark_border_outlined,
                          size: size.width * 0.07),
                      SizedBox(width: 10),
                      Icon(Icons.share_outlined, size: size.width * 0.07),
                    ],
                  ),
                ),
                const Divider(
                  color: ConstantValue.textLightColor,
                ),
                SizedBox(
                  height: 10,
                ),
                DetailTabView(isFood: isFood, foodDetailModel: foodDetailModel, beverageDetailModel: beverageDetailModel,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getimageThumbUrl(){
    var image ="";
    if(isFood){
      image = foodDetailModel?.meals.first.strMealThumb?? "";
    }else{
      image = beverageDetailModel?.drinks.first.strDrinkThumb ?? "";
    }

    return image;

  }

}

