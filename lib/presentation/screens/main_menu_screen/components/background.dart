import 'package:astro_assignment_project/constants/constant.dart';
import 'package:flutter/material.dart';

class MainScreenBackground extends StatelessWidget {
  final Widget child;
  const MainScreenBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            height: size.height * 0.6,
            width: size.width * 0.2,
              decoration: const BoxDecoration(
                color: ConstantValue.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                ),
              )
          ),
          child,
        ],
      ),
    );
  }
}
