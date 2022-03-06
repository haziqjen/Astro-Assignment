import 'package:astro_assignment_project/business_logic/bloc/detail/beverage_detail_bloc/beverage_detail_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/detail/food_detail_bloc/detail_food_bloc.dart';
import 'package:astro_assignment_project/business_logic/bloc/detail/ingredient_counter_cubit/ingredient_counter_cubit.dart';
import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/presentation/screens/detail_screen/components/body.dart';
import 'package:astro_assignment_project/presentation/screens/detail_screen/components/detail_appbar.dart';
import 'package:astro_assignment_project/presentation/screens/detail_screen/components/tab_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../router/route_names.dart';


class DetailScreen extends StatefulWidget {
  final String menuId;
  final bool isFood;
  const DetailScreen({Key? key, required this.menuId, required this.isFood}) : super(key: key);

  static const String routeName = RouteName.DETAIL_SCREEN;

  static Route route({required String menuId, required bool isFood}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => DetailScreen(menuId: menuId, isFood: isFood),
    );
  }

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstantValue.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: DetailAppBar(context),
      body: widget.isFood ? BlocBuilder<DetailFoodBloc, DetailFoodState>(
        builder: (context, state) {
          if(state is DetailFoodLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is DetailFoodSuccessState){
            return DetailBody(foodDetailModel: state.foodDetailModel,isFood: true,);
          }else if(state is DetailFoodFailState){
            return Center(
              child: Text('Something went wrong!'),
            );
          }


          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ) : BlocBuilder<BeverageDetailBloc, BeverageDetailState>(
        builder: (context, state) {
          if(state is DetailBeverageLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is DetailBeverageSuccessState){
            return DetailBody(beverageDetailModel: state.beverageDetailModel,isFood: false,);
          }else if(state is DetailBeverageFailState){
            return Center(
              child: Text('Something went wrong!'),
            );
          }


          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
   if(widget.isFood) {
     context.read<DetailFoodBloc>().add(FetchDetailFoodEvent(id: widget.menuId));
   } else {
     context.read<BeverageDetailBloc>().add(FetchDetailBeverageEvent(id: widget.menuId));
   }

  }


}

