import 'package:astro_assignment_project/data/models/detail/beverage_detail_model.dart';
import 'package:astro_assignment_project/data/models/detail/food_detail_model.dart';
import 'package:fraction/fraction.dart';

class IngredientModel {
  late final String ingredient;
  late final String measurement;
  late final String img;
  late final double? measurementNumber;

  IngredientModel(
      {required this.ingredient,
      required this.measurement,
      required this.img,
       this.measurementNumber});
}

class IngredientList {
  final bool isFood;
  final FoodDetailModel? foodDetailModel;
  final BeverageDetailModel? beverageDetailModel;

  IngredientList(this.isFood, this.foodDetailModel, this.beverageDetailModel);

  List<IngredientModel> getIngredientList() {
    var ingredientList = <IngredientModel>[];

    if (isFood) {
      if (foodDetailModel?.meals.first.strIngredient1 != null) {
        if (foodDetailModel!.meals.first.strIngredient1!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient1 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure1 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient1 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure1 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient2 != null) {
        if (foodDetailModel!.meals.first.strIngredient2!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient2 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure2 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient2 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure2 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient3 != null) {
        if (foodDetailModel!.meals.first.strIngredient3!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient3 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure3 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient3 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure3 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient4 != null) {
        if (foodDetailModel!.meals.first.strIngredient4!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient4 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure4 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient4 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure4 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient5 != null) {
        if (foodDetailModel!.meals.first.strIngredient5!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient5 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure5 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient5 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure5 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient6 != null) {
        if (foodDetailModel!.meals.first.strIngredient6!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient6 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure6 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient6 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure6 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient7 != null) {
        if (foodDetailModel!.meals.first.strIngredient7!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient7 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure7 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient7 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure7 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient8 != null) {
        if (foodDetailModel!.meals.first.strIngredient8!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient8 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure8 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient8 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure8 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient9 != null) {
        if (foodDetailModel!.meals.first.strIngredient9!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient9 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure9 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient9 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure9 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient10 != null) {
        if (foodDetailModel!.meals.first.strIngredient10!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient10 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure10 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient10 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure10 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient11 != null) {
        if (foodDetailModel!.meals.first.strIngredient11!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient11 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure11 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient11 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure1 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }


      if (foodDetailModel?.meals.first.strIngredient12 != null) {
        if (foodDetailModel!.meals.first.strIngredient12!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient12 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure12 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient12 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure12 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient13 != null) {
        if (foodDetailModel!.meals.first.strIngredient13!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient13 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure13 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient13 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure13 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient14 != null) {
        if (foodDetailModel!.meals.first.strIngredient14!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient14 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure14 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient14 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure14 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient15 != null) {
        if (foodDetailModel!.meals.first.strIngredient15!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient15 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure15 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient15 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure15 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient16 != null) {
        if (foodDetailModel!.meals.first.strIngredient16!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient16 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure16 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient16 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure16 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient17 != null) {
        if (foodDetailModel!.meals.first.strIngredient17!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient17 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure17 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient17 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure17 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient18 != null) {
        if (foodDetailModel!.meals.first.strIngredient18!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient18 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure18 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient18 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure18 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient19 != null) {
        if (foodDetailModel!.meals.first.strIngredient19!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient19 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure19 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient19 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure19 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (foodDetailModel?.meals.first.strIngredient20 != null) {
        if (foodDetailModel!.meals.first.strIngredient20!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  foodDetailModel?.meals.first.strIngredient20 ?? ""),
              measurement: foodDetailModel?.meals.first.strMeasure20 ?? "",
              ingredient: foodDetailModel?.meals.first.strIngredient20 ?? "",
              measurementNumber: getActualMeasurement(
                  foodDetailModel?.meals.first.strMeasure20 ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }


    }else{
      if (beverageDetailModel?.drinks.first.strIngredient1 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient1!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient1 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure1 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient1 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure1?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient2 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient2!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient2 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure2 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient2 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure2?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient3 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient3!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient3 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure3 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient3 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure3?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient4 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient4!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient4 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure4 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient4 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure4?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }


      if (beverageDetailModel?.drinks.first.strIngredient5 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient5!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient5 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure5 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient5 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure5?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient6 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient6!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient6 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure6 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient6 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure6?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient7 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient7!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient7 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure7 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient7 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure7?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient8 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient8!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient8 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure8 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient8 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure8?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient9 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient9!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient9 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure9 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient9 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure9?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient10 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient10!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient10 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure10 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient10 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure10?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient11 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient11!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient11 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure11 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient11 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure11?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient12 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient12!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient12 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure12 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient12 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure12?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient13 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient13!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient13 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure13 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient13 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure13?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient14 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient14!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient14 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure14 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient14 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure14?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }

      if (beverageDetailModel?.drinks.first.strIngredient15 != null) {
        if (beverageDetailModel!.drinks.first.strIngredient15!.isNotEmpty) {
          IngredientModel foodIngredientModel = IngredientModel(
              img: getProperImageUrl(
                  beverageDetailModel?.drinks.first.strIngredient15 ?? ""),
              measurement: beverageDetailModel?.drinks.first.strMeasure15 ?? "",
              ingredient: beverageDetailModel?.drinks.first.strIngredient15 ?? "",
              measurementNumber: getActualMeasurement(
                  beverageDetailModel?.drinks.first.strMeasure15?.trim() ?? ""));
          ingredientList.add(foodIngredientModel);
        }
      }


    }

    return ingredientList;
  }

  String getProperImageUrl(String item) {
    var url;
    if (isFood) {
      url = "https://www.themealdb.com/images/ingredients/$item.png";
    } else {
      url = "https://www.thecocktaildb.com/images/ingredients/$item.png";
    }
    return Uri.encodeFull(url);
  }

  double? getActualMeasurement(String measurement) {
    double? actual = 0.0;
    if (double.tryParse(measurement.replaceAll(RegExp(r'[^0-9]'), '')) !=
        null) {
      if (measurement.contains('/')) {
        actual = Rational.tryParse(measurement.replaceAll(RegExp(r'[^0-9, /]'), '').trim())
            ?.toDouble();
      } else {
        actual = double.parse(measurement.replaceAll(RegExp(r'[^0-9]'), ''));
      }
    }
    return actual;
  }
}
