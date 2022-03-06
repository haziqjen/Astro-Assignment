import 'dart:convert';
import 'dart:developer';

import 'package:astro_assignment_project/constants/http/http_services.dart';
import 'package:astro_assignment_project/data/models/detail/beverage_detail_model.dart';
import 'package:astro_assignment_project/data/models/detail/food_detail_model.dart';
import 'package:dio/dio.dart' as dio;

class DetailRepository{
  final APIService api = APIService();

  Future<FoodDetailModel?> getFoodDetailModel(String id) async {
    try {

      dio.Response response = await api
          .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
      var detailJson = jsonEncode(response.data);
      final detailModel = foodDetailModelFromJson(detailJson);
      return detailModel;
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  Future<BeverageDetailModel?> getBeverageDetailModel(String id) async {
    try {

      dio.Response response = await api
          .get('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id');
      var detailJson = jsonEncode(response.data);
      final detailModel = beverageDetailModelFromJson(detailJson);
      return detailModel;
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

}