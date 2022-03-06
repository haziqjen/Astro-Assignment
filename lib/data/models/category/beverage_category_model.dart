// To parse this JSON data, do
//
//     final beverageCategoryModel = beverageCategoryModelFromJson(jsonString);

import 'dart:convert';

BeverageCategoryModel beverageCategoryModelFromJson(String str) => BeverageCategoryModel.fromJson(json.decode(str));

String beverageCategoryModelToJson(BeverageCategoryModel data) => json.encode(data.toJson());

class BeverageCategoryModel {
  BeverageCategoryModel({
    required this.drinks,
  });

  List<Drink> drinks;

  factory BeverageCategoryModel.fromJson(Map<String, dynamic> json) => BeverageCategoryModel(
    drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

class Drink {
  Drink({
    required this.strCategory,
  });

  String strCategory;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    strCategory: json["strCategory"],
  );

  Map<String, dynamic> toJson() => {
    "strCategory": strCategory,
  };
}
