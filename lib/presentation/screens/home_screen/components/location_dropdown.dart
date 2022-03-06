import 'package:astro_assignment_project/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({Key? key}) : super(key: key);

  @override
  _LocationSectionState createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivering to',
          textAlign: TextAlign.start,
          style: GoogleFonts.montserrat(color: ConstantValue.textLightColor,
          fontSize: MediaQuery.of(context).size.height * 0.018),),
          Row(
            children: [
              Text('Current Location',
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(color: ConstantValue.textLightColor,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.w600),),

              SizedBox(width: 30,),
              Icon(Icons.keyboard_arrow_down, color: ConstantValue.primaryColor,)
            ],
          )
        ],
      ),
    );
  }
}
