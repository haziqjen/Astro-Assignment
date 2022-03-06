import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/data/models/menu/food_menu_model.dart';
import 'package:astro_assignment_project/presentation/screens/detail_screen/detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String id;
  final bool isFood;
  const MenuCard({Key? key, required this.imgUrl, required this.name, required this.id, required this.isFood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: [id, isFood])
      },
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
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(imgUrl),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                name,
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.w600),
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
                  Text(
                    '4.9',
                    style: GoogleFonts.montserrat(
                        color: ConstantValue.primaryColor,
                        fontSize: size.height * 0.018,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(124 Ratings) Cafe • Western Food',
                    style: GoogleFonts.montserrat(
                        color: ConstantValue.textLightColor,
                        fontSize: size.height * 0.018,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
