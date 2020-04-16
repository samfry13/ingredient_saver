import 'package:flutter/material.dart';

import 'IngredientsDetailsPage.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key, this.title, this.itemCount}) : super(key: key);
  final String title;
  final int itemCount;

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.itemCount,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  IngredientsDetailsPage(title: "Ingredient", amount: "5", suffix: "lbs", expirationDate: "01/01/2021",)));
            },
            child: ListTile(
              title: Text("Ingredient"),
              subtitle: Text("Expires on 01/01/2021"),
              trailing: Text("5 lbs"),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}