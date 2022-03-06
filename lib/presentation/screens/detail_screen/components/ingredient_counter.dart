import 'package:astro_assignment_project/business_logic/bloc/detail/ingredient_counter_cubit/ingredient_counter_cubit.dart';
import 'package:astro_assignment_project/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientCounterSection extends StatelessWidget {
  final int counterState;
  const IngredientCounterSection({Key? key, required this.counterState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      width: size.width,
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredient For',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '$counterState servings',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: size.height * 0.016,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              context.read<IngredientCounterCubit>().increment();
            },
            child: Container(
              width: size.width * 0.1,
              height: size.width * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ConstantValue.primaryColor,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            counterState.toString(),
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              context.read<IngredientCounterCubit>().decrement();
            },
            child: Container(
              width: size.width * 0.1,
              height: size.width * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ConstantValue.primaryColor,
              ),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );


  }
}
