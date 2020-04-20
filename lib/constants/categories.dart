import 'package:ingredientsaver/models/Category.dart';
import 'package:ingredientsaver/models/Ingredient.dart';
import 'package:ingredientsaver/constants/suffixes.dart';

List<Category> categories = [
  Category("Plant-Based Materials", [
    Ingredient.withArguments("Kale", "1", Suffixes.NONE, DateTime.now().add(new Duration(days: 14)).toString()),
    Ingredient.withArguments("Peanuts", "24", Suffixes.OUNCES, DateTime.now().add(new Duration(days: 200)).toString()),
    Ingredient.withArguments("Canteloup", "2", Suffixes.NONE, DateTime.now().add(new Duration(days: 7)).toString()),
    Ingredient.withArguments("Lentils", "5", Suffixes.CUPS, DateTime.now().add(new Duration(days: 14)).toString())
  ]),
  Category("Spices", [
    Ingredient.withArguments("Thyme", "28", Suffixes.TABLESPOONS, ""),
    Ingredient.withArguments("Cardamum", "50", Suffixes.TABLESPOONS, ""),
    Ingredient.withArguments("Pepper Corns", "4", Suffixes.CUPS, "")
  ]),
  Category("Protiens", [
    Ingredient.withArguments("Chuck Steak", "5", Suffixes.POUNDS, DateTime.now().add(new Duration(days: 4)).toString()),
    Ingredient.withArguments("Frozen Chicken Breasts", "6", Suffixes.NONE, DateTime.now().add(new Duration(days: 21)).toString()),
    Ingredient.withArguments("Bacon", "10", Suffixes.STRIPS, DateTime.now().add(new Duration(days: 7)).toString())
  ]),
  Category("Fats, Oils & Fatty Acids", []),
  Category("Grain-Based Materials", []),
  Category("Dairy Products", [])
];