import 'package:flutter/material.dart';
import 'package:ingredientsaver/CategoryPage.dart';
import 'package:ingredientsaver/IngredientsDetailsPage.dart';

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
    focusNode.unfocus();
    focusNode.dispose();
    textEditingController.clearComposing();
    textEditingController.clear();
    textEditingController.dispose();
    super.dispose();
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
              child: Text("Expiring Soon", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    IngredientsDetailsPage(title: "Ingredient", amount: "5 lbs", expirationDate: "01/01/2021",)));
              },
              child: ListTile(
                title: Text("Ingredient"),
                subtitle: Text("Expires on 01/01/2021"),
                trailing: Text("5 lbs"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    IngredientsDetailsPage(title: "Ingredient", amount: "5 lbs", expirationDate: "01/01/2021",)));
              },
              child: ListTile(
                title: Text("Ingredient"),
                subtitle: Text("Expires on 01/01/2021"),
                trailing: Text("5 lbs"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    IngredientsDetailsPage(title: "Ingredient", amount: "5 lbs", expirationDate: "01/01/2021",)));
              },
              child: ListTile(
                title: Text("Ingredient"),
                subtitle: Text("Expires on 01/01/2021"),
                trailing: Text("5 lbs"),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text("Categories", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    CategoryPage(title: "Ingredient", itemCount: 2,)));
              },
              child: ListTile(
                title: Text("Category"),
                trailing: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text("2 items"),
                      Icon(Icons.keyboard_arrow_right)
                    ]
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    CategoryPage(title: "Ingredient", itemCount: 5,)));
              },
              child: ListTile(
                title: Text("Category"),
                trailing: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text("5 items"),
                      Icon(Icons.keyboard_arrow_right)
                    ]
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    CategoryPage(title: "Ingredient", itemCount: 6,)));
              },
              child: ListTile(
                title: Text("Category"),
                trailing: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text("6 items"),
                      Icon(Icons.keyboard_arrow_right)
                    ]
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    CategoryPage(title: "Ingredient", itemCount: 4,)));
              },
              child: ListTile(
                title: Text("Category"),
                trailing: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text("4 items"),
                      Icon(Icons.keyboard_arrow_right)
                    ]
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    CategoryPage(title: "Ingredient", itemCount: 8,)));
              },
              child: ListTile(
                title: Text("Category"),
                trailing: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text("8 items"),
                      Icon(Icons.keyboard_arrow_right)
                    ]
                ),
              ),
            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}