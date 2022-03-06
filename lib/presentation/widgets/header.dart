import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constant.dart';

class HeaderSection extends StatefulWidget {
  final String title;
  const HeaderSection({Key? key, required this.title}) : super(key: key);

  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Text(widget.title, style: GoogleFonts.montserrat(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.black,
            ),),
            const Spacer(),
            const Icon(Icons.shopping_cart)
          ],
        ),
      ),
    );
  }
}
