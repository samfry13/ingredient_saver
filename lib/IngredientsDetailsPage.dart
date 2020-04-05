import 'package:flutter/material.dart';

class IngredientsDetailsPage extends StatefulWidget {
  IngredientsDetailsPage({Key key, this.title, this.expirationDate, this.amount}) : super(key: key);
  final String title;
  final String expirationDate;
  final String amount;

  @override
  _IngredientsDetailsPageState createState() => _IngredientsDetailsPageState();
}

class _IngredientsDetailsPageState extends State<IngredientsDetailsPage> {

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: Text(widget.title),
                subtitle: Text("Expires on " + widget.expirationDate),
                trailing: Text(widget.amount),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Divider(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Recipes",
                        style: TextStyle(
                            color: Color.fromRGBO(0x00, 0x00, 0x00, 0.5)
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Divider(),
                    )
                  ],
                ),
              ),
            ]),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: (160 / 240),
              children: createRecipeCards(8),
            ),
          ),
        ],
      ),
    );
  }
}