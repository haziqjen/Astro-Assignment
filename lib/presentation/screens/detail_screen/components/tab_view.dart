import 'package:astro_assignment_project/business_logic/bloc/detail/ingredient_counter_cubit/ingredient_counter_cubit.dart';
import 'package:astro_assignment_project/constants/constant.dart';
import 'package:astro_assignment_project/data/models/detail/beverage_detail_model.dart';
import 'package:astro_assignment_project/data/models/detail/food_detail_model.dart';
import 'package:astro_assignment_project/presentation/screens/detail_screen/components/ingredient_counter.dart';
import 'package:astro_assignment_project/presentation/screens/detail_screen/components/ingredient_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTabView extends StatefulWidget {
  final FoodDetailModel? foodDetailModel;
  final BeverageDetailModel? beverageDetailModel;
  final bool isFood;

  const DetailTabView(
      {Key? key,
      this.foodDetailModel,
      this.beverageDetailModel,
      required this.isFood})
      : super(key: key);

  @override
  _DetailTabViewState createState() => _DetailTabViewState();
}

class _DetailTabViewState extends State<DetailTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          // give the tab bar a height [can change hheight to preferred height]
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelStyle: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.w400),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                color: ConstantValue.primaryColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: ConstantValue.textLightColor,
              tabs: const [
                Tab(
                  text: 'Ingredients',
                ),
                Tab(
                  text: 'Steps',
                ),
                Tab(
                  text: 'Nutrition',
                ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  width: size.width,
                  child: BlocBuilder<IngredientCounterCubit, int>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          IngredientCounterSection(counterState: state),
                          IngredientListView(
                            beverageDetailModel: widget.beverageDetailModel,
                            foodDetailModel: widget.foodDetailModel,
                            isFood: widget.isFood,
                            counterState: state,
                          )
                        ],
                      );
                    },
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        widget.isFood? widget.foodDetailModel!.meals.first.strInstructions! :
                        (widget.beverageDetailModel!.drinks.first.strInstructions!),
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w400)
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


  }
}
