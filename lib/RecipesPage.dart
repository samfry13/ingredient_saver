import 'package:flutter/material.dart';

class RecipesPage extends StatefulWidget {
  RecipesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {

  createRecipeCards (int d){

    var recipes = <Widget>[];
    var list = new List<int>.generate(d, (i) =>i + 1 );

    list.forEach((i) {
      return recipes.add(new Container(
        height: 240,
        width: 160,
        child: Card(
          color: Theme.of(context).accentColor,
          child: InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 11,
                  child: FittedBox(fit: BoxFit.cover, child: Image.asset("assets/recipe.jpg")),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Text("Gourmet Nachos", style: TextStyle(fontSize: 14)),
                        ),
                        Text("3/5 Ingredients Owned", style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),);
    });
    return recipes;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: (160 / 240),
          children: createRecipeCards(16),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}