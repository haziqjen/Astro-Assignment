// To parse this JSON data, do
//
//     final foodMenuModel = foodMenuModelFromJson(jsonString);

import 'dart:convert';

FoodMenuModel foodMenuModelFromJson(String str) => FoodMenuModel.fromJson(json.decode(str));

String foodMenuModelToJson(FoodMenuModel data) => json.encode(data.toJson());

class FoodMenuModel {
  FoodMenuModel({
    required this.meals,
  });

  List<Meal> meals;

  factory FoodMenuModel.fromJson(Map<String, dynamic> json) => FoodMenuModel(
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  String strMeal;
  String strMealThumb;
  String idMeal;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}
