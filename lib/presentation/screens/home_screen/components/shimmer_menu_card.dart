import 'package:astro_assignment_project/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMenuCard extends StatelessWidget {
  const ShimmerMenuCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.white70,
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                  ),),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                     height: size.height * 0.02,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ConstantValue.primaryColor,
                          size:
                          MediaQuery.of(context).size.height * 0.018,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          color: Colors.grey,
                         width: size.width* 0.4,
                          height: size.width * 0.05,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.white70,
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: size.height * 0.02,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ConstantValue.primaryColor,
                          size:
                          MediaQuery.of(context).size.height * 0.018,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          color: Colors.grey,
                          width: size.width* 0.4,
                          height: size.width * 0.05,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

