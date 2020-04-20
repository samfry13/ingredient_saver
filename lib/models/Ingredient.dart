class Ingredient {
  String name;
  String amount;
  String suffix;
  String expirationDate;

  Ingredient() {
    this.name = "";
    this.amount = "";
    this.suffix = "";
    this.expirationDate = "";
  }

  Ingredient.withArguments(String name, String amount, String suffix, String expirationDate) {
    this.name = name;
    this.amount = amount;
    this.suffix = suffix;
    this.expirationDate = expirationDate;
  }
}