// To parse this JSON data, do
//
//     final beverageMenuModel = beverageMenuModelFromJson(jsonString);

import 'dart:convert';

BeverageMenuModel beverageMenuModelFromJson(String str) => BeverageMenuModel.fromJson(json.decode(str));

String beverageMenuModelToJson(BeverageMenuModel data) => json.encode(data.toJson());

class BeverageMenuModel {
  BeverageMenuModel({
    required this.drinks,
  });

  List<Drink> drinks;

  factory BeverageMenuModel.fromJson(Map<String, dynamic> json) => BeverageMenuModel(
    drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

class Drink {
  Drink({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  });

  String strDrink;
  String strDrinkThumb;
  String idDrink;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    strDrink: json["strDrink"],
    strDrinkThumb: json["strDrinkThumb"],
    idDrink: json["idDrink"],
  );

  Map<String, dynamic> toJson() => {
    "strDrink": strDrink,
    "strDrinkThumb": strDrinkThumb,
    "idDrink": idDrink,
  };
}
