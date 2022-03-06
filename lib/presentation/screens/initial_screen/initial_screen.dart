import 'package:animate_do/animate_do.dart';
import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/presentation/router/route_names.dart';
import 'package:astro_assignment_project/presentation/screens/initial_screen/components/next_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  static const String routeName = RouteName.INITIAL_SCREEN;

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const InitialScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 50,),
            Lottie.asset('assets/lottie/into_screen.json'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    duration: const Duration(milliseconds: 1000),
                    child: Row(
                      children: [
                        // Text("Astro", style: GoogleFonts.sourceSansPro(
                        //     fontSize: 36,
                        //     fontWeight: FontWeight.w600
                        // ),),
                        Text("Flutter", style: GoogleFonts.montserrat(
                            fontSize: 36,
                            color: ConstantValue.primaryColor,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    duration: const Duration(milliseconds: 1000),
                    child: Text("Assignment", style: GoogleFonts.montserrat(
                        fontSize: 36,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  const SizedBox(height: 10,),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1200),
                    duration: const Duration(milliseconds: 1000),
                    child: Text("This assignment was made by Haziq Shukor\nFor Astro used only",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          height: 1.8,
                          color: Colors.grey.shade700
                      ),),
                  ),
                ],
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 1300),
              duration: const Duration(milliseconds: 1000),
              child: const Padding(
                padding: EdgeInsets.all(30.0),
                child: Align(child: NextButton(), alignment: Alignment.centerRight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

