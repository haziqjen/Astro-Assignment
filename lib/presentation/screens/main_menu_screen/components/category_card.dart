import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/presentation/screens/home_screen/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatefulWidget {
  final String title;
  final int items;
  final bool isCircle;
  final String imageUrl;
  const CategoryCard({Key? key, required this.title, required this.items, required this.isCircle, required this.imageUrl}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> {
        Navigator.pushNamed(context, HomeScreen.routeName, arguments: widget.title=="Food")
      },
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 30, right: 10, bottom: 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, right: 20),
                child: Card(
                  shadowColor: Colors.black87,
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Expanded(child: SizedBox()),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: size.height * 0.12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.title,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height*0.04,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${widget.items} items',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black38
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              widget.isCircle ?
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black38, spreadRadius: 2)],
                    ),
                    child: CircleAvatar(
                      radius: size.height * 0.05,
                      backgroundColor: Colors.transparent,
                      backgroundImage:  CachedNetworkImageProvider(
                         widget.imageUrl),
                    ),
                  ),
                ),
              ) : Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: size.width * 0.2,
                    width: size.width *0.2,
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.black38, spreadRadius: 2)],
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.black38
                      image: DecorationImage(image: CachedNetworkImageProvider(widget.imageUrl)
                      , fit: BoxFit.cover)
                    ),
                ),)
              )
              ,
              Positioned.fill(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: size.width *0.1,
                      height: size.height * 0.1,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 3)
                        ],
                      ),
                      child: Icon(Icons.chevron_right_rounded,
                        color: ConstantValue.primaryColor,
                      size: size.width * 0.1,),
                    ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
