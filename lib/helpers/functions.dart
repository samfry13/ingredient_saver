import 'package:ingredientsaver/constants/categories.dart';
import 'package:ingredientsaver/models/Category.dart';
import 'package:ingredientsaver/models/Ingredient.dart';

String formatDateTimeString(String dateTimeString) {
  if (dateTimeString.isEmpty) {
    return dateTimeString;
  }

  DateTime time = DateTime.parse(dateTimeString);
  return "${time.month}/${time.day}/${time.year}";
}

List<Ingredient> getExpiringIngredients(List<Category> categories) {
  var ingredients = <Ingredient>[];
  categories.forEach((category) {
    category.ingredients.forEach((ingredient) {
      ingredients.add(ingredient);
    });
  });

  ingredients.sort((a, b) {
    if (a.expirationDate.isEmpty && b.expirationDate.isNotEmpty) {
      return 1;
    }

    if (a.expirationDate.isNotEmpty && b.expirationDate.isEmpty) {
      return -1;
    }

    if (a.expirationDate.isEmpty && b.expirationDate.isEmpty) {
      return 0;
    }

    if (DateTime.parse(a.expirationDate).isBefore(DateTime.parse(b.expirationDate))) {
      return -1;
    }

    if (DateTime.parse(a.expirationDate).isAfter(DateTime.parse(b.expirationDate))) {
      return 1;
    }

    if (DateTime.parse(a.expirationDate).isAtSameMomentAs(DateTime.parse(b.expirationDate))) {
      return 0;
    }

    return null;
  });

  return ingredients.getRange(0, 3).toList();
}

int getIngredientCount() {
  int count = 0;
  categories.forEach((category) {
    category.ingredients.forEach((ingredient) {
      count++;
    });
  });

  return count;
}