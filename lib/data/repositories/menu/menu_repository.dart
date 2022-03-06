import 'dart:convert';
import 'dart:developer';

import 'package:astro_assignment_project/constants/http/http_services.dart';
import 'package:astro_assignment_project/data/models/menu/beverage_menu_model.dart';
import 'package:astro_assignment_project/data/models/menu/food_menu_model.dart';
import 'package:dio/dio.dart' as dio;

class MenuRepository{
  final APIService api = APIService();

  Future<FoodMenuModel?> getFoodMenuModel(String category) async {
    try {
      dio.Response response = await api
          .get('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
      var categoryJson = jsonEncode(response.data);
      final categoryModel = foodMenuModelFromJson(categoryJson);
      return categoryModel;
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  Future<BeverageMenuModel?> getBeverageMenuModel(String category) async {
    try {
      dio.Response response = await api
          .get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$category');
      var categoryJson = jsonEncode(response.data);
      final categoryModel = beverageMenuModelFromJson(categoryJson);
      return categoryModel;
    } catch (e) {
      log(e.toString());
    }

    return null;
  }
}