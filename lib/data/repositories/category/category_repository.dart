import 'dart:convert';
import 'dart:developer';
import 'package:astro_assignment_project/data/models/category/beverage_category_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:astro_assignment_project/constants/http/http_services.dart';

import '../../models/category/food_category_model.dart';

class CategoryRepository{
  final APIService api = APIService();

  Future<FoodCategoryModel?> getFoodCategoryModel() async {
    try {
      dio.Response response = await api
          .get('https://www.themealdb.com/api/json/v1/1/categories.php');
      var categoryJson = jsonEncode(response.data);
      final categoryModel = categoryModelFromJson(categoryJson);
      return categoryModel;
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  Future<BeverageCategoryModel?> getBeverageCategoryModel() async {
    try {
      dio.Response response = await api
          .get('https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list');
      var categoryJson = jsonEncode(response.data);
      final categoryModel = beverageCategoryModelFromJson(categoryJson);
      return categoryModel;
    } catch (e) {
      log(e.toString());
    }

    return null;
  }
}