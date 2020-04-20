import 'package:flutter/material.dart';
import 'package:ingredientsaver/helpers/functions.dart';
import 'package:ingredientsaver/models/Ingredient.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:ingredientsaver/constants/suffixes.dart';

class IngredientsDetailsPage extends StatefulWidget {
  IngredientsDetailsPage({Key key, this.ingredient}) : super(key: key);
  final Ingredient ingredient;

  @override
  _IngredientsDetailsPageState createState() => _IngredientsDetailsPageState();
}

class _IngredientsDetailsPageState extends State<IngredientsDetailsPage> {
  bool isEditing = false;
  final FocusNode focusNode = new FocusNode();
  final TextEditingController textEditingController = new TextEditingController();
  String currentSuffix;
  String currentAmount;

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    currentSuffix = widget.ingredient.suffix;
    currentAmount = widget.ingredient.amount;
    focusNode.addListener(() {
      if (isEditing && !focusNode.hasFocus && focusNode.canRequestFocus) {
        focusNode.requestFocus();
      }
      if (!isEditing && focusNode.hasFocus) {
        focusNode.unfocus();
      }
    });
    textEditingController.addListener(() {
      this.setState(() => { currentAmount = textEditingController.text });
    });
    textEditingController.text = currentAmount;
    super.initState();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: false,
      actions: [
        KeyboardAction(
          focusNode: focusNode,
          onTapAction: () {
            focusNode.unfocus();
            this.setState(() => { isEditing = false });
          },
          footerBuilder: (context) {
            return PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: suffixesList.length,
                  itemExtent: 75,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => this.setState(() => { currentSuffix = index == 0 ? "" : suffixesList[index] }),
                      child: Center(child: Text(suffixesList[index])),
                    );
                  },
                ),
              ),
            );
          },
        )
      ]
    );
  }

  List<Widget> createRecipeCards (int d) {
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
        title: Text(widget.ingredient.name),
      ),
      body: KeyboardActions(
        config: _buildConfig(context),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  title: Text(widget.ingredient.name),
                  subtitle: Text("Expires on ${formatDateTimeString(widget.ingredient.expirationDate)}"),
                  trailing: isEditing ? Container(
                    width: 100,
                    child: TextField(
                      autofocus: true,
                      focusNode: focusNode,
                      controller: textEditingController,
                      textAlign: TextAlign.end,
                      onEditingComplete: () {
                        focusNode.unfocus();
                        this.setState(() => { isEditing = false });
                      },
                      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                      decoration: InputDecoration(
                        suffixText: currentSuffix
                      ),
                    ),
                  ) : InkWell(
                    onTap: () {
                      this.setState(() { isEditing = true; });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(currentAmount + " " + currentSuffix),
                        )
                    ),
                  ),
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
      ),
    );
  }
}