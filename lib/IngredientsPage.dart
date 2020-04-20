import 'package:flutter/material.dart';
import 'package:ingredientsaver/CategoryPage.dart';
import 'package:ingredientsaver/IngredientsDetailsPage.dart';
import 'package:ingredientsaver/constants/categories.dart';
import 'package:ingredientsaver/helpers/functions.dart';

class IngredientsPage extends StatefulWidget {
  IngredientsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  bool isSearching = false;
  TextEditingController textEditingController = new TextEditingController();
  FocusNode focusNode = new FocusNode();

  void initState() {
    super.initState();
    textEditingController.addListener(() {
      this.setState(() { isSearching = textEditingController.text != ""; });
    });
  }

  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  List<Widget> buildExpiringSoon() {
    var ingredients = <Widget>[];

    getExpiringIngredients(categories).forEach((ingredient) {
      return ingredients.add(InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              IngredientsDetailsPage(ingredient: ingredient)));
        },
        child: ListTile(
          title: Text(ingredient.name),
          subtitle: Text("Expires on ${formatDateTimeString(ingredient.expirationDate)}"),
          trailing: Text("${ingredient.amount} ${ingredient.suffix}"),
        ),
      ));
    });

    return ingredients;
  }

  List<Widget> buildCategories() {
    var newCategories = <Widget>[];

    categories.forEach((category) {
      return newCategories.add(new InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              CategoryPage(category: category,)));
        },
        child: ListTile(
          title: Text(category.title),
          trailing: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Text("${category.ingredients.length} ${category.ingredients.length == 1 ? "item" : "items"}"),
                Icon(Icons.keyboard_arrow_right)
              ]
          ),
        ),
      ));
    });

    return newCategories;
  }

  Widget buildSearchView() {
    if (isSearching != null && isSearching) {
      return Expanded(
        child: ListView.builder(
            itemCount: 24,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                  child: Text("Results", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                );
              }

              return InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Ingredient"),
                  subtitle: Text("Expires on 01/01/2021"),
                  trailing: Text("5 lbs"),
                ),
              );
            }
        ),
      );
    }
    else {
      return Expanded(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
              child: Text("Expiring Soon", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            ...buildExpiringSoon(),
            Divider(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text("Categories", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            ...buildCategories(),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextField(
              focusNode: focusNode,
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
                suffixIcon: isSearching ? IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    textEditingController.clearComposing();
                    textEditingController.clear();
                    focusNode.unfocus();
                  },
                ) : null
              ),
            ),
          ),
          buildSearchView(),
        ],
      ),

    );
  }
}