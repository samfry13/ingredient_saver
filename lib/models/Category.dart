import 'package:ingredientsaver/models/Ingredient.dart';

class Category {
  String title;
  List<Ingredient> ingredients;

  Category(String title, List<Ingredient> ingredients) {
    this.title = title;
    this.ingredients = ingredients;
  }
}