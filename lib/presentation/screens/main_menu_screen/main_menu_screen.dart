import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:astro_assignment_project/presentation/router/route_names.dart';
import 'package:astro_assignment_project/presentation/screens/main_menu_screen/components/background.dart';
import 'package:astro_assignment_project/presentation/screens/main_menu_screen/components/category_card.dart';
import 'package:astro_assignment_project/presentation/widgets/header.dart';
import 'package:astro_assignment_project/presentation/widgets/search_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  static const String routeName = RouteName.MAIN_MENU_SCREEN;

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const MainMenuScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int min = 1;
    int max = 1000;
    return Scaffold(
      backgroundColor: Colors.grey[10],
      body: SafeArea(
        child: MainScreenBackground(
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children:  [
                FadeInDown(
                    duration: const Duration(milliseconds: 500),
                    child: HeaderSection(title: 'Menu',)),
                FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 500),
                    child: SearchTextField()),
                FadeInRight(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 500),
                  child: CategoryCard(
                      title: 'Food',
                      items: Random().nextInt(max - min) + min,
                      imageUrl:
                      'https://i.picsum.photos/id/488/1772/1181.jpg?hmac=psl3qLyDefO6AYqU4TJQ8PNCjS8RdPiP_vRLB8WPVjY',
                      isCircle: true),
                ),
                FadeInLeft(
                  delay: const Duration(milliseconds: 600),
                  duration: const Duration(milliseconds: 500),
                  child: CategoryCard(
                      title: 'Beverage',
                      items: Random().nextInt(max - min) + min,
                      imageUrl:
                      'https://i.picsum.photos/id/431/5398/3599.jpg?hmac=bc325kFqsm626RGhgs-XwG_GFqd4x3VmXtramO12qL8',
                      isCircle: false),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

