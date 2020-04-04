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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
