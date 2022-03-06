import 'package:astro_assignment_project/presentation/screens/main_menu_screen/main_menu_screen.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constant.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 6)
      ], shape: BoxShape.circle, color: ConstantValue.primaryColor),
      child: FittedBox(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => Navigator.pushReplacementNamed(context, MainMenuScreen.routeName),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
