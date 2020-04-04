import 'package:flutter/material.dart';
import 'IngredientsPage.dart';
import 'RecipesPage.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  Widget buildListTile(
      String title, String subtitle, String imageURI, EdgeInsets margin, Function onPressed) {
    return Container(
      margin: margin,
      child: Card(
        color: Theme.of(context).accentColor,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1.0,
                          blurRadius: 20.0
                        )]
                      ),
                        height: 100,
                        width: 100,
                        child: FittedBox(
                            fit: BoxFit.cover, child: Image.asset(imageURI)))),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                          Text(subtitle)
                        ],
                      ),
                    )),
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            buildListTile(
                "Ingredients",
                "57 Saved",
                "assets/spices.jpg",
                EdgeInsets.fromLTRB(16, 32, 16, 0),
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              IngredientsPage(title: "Ingredients")));
                }
            ),
            buildListTile(
                "Recipes",
                "321 Saved",
                "assets/recipe.jpg",
                EdgeInsets.fromLTRB(16, 16, 16, 0),
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipesPage(title: "Recipes")));
                }
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
                        "Featured",
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        height: 240,
                        width: 160,
                        child: Card(
                          color: Theme.of(context).accentColor,
                          child: InkWell(
                            onTap: () {

                            },
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 11,
                                  child: FittedBox(
                                      fit: BoxFit.cover, child: Image.asset("assets/recipe.jpg"))
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                    child: Container(
                                      width: 160,
                                      height: 64,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                            child: Text("Gourmet Nachos", style: TextStyle(fontSize: 14),),
                                          ),
                                          Text("3/5 Ingredients Owned", style: TextStyle(fontSize: 12),)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
