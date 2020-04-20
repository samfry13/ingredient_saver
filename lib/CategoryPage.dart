import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:ingredientsaver/helpers/functions.dart';
import 'package:ingredientsaver/models/Category.dart';
import 'package:ingredientsaver/models/Ingredient.dart';
import 'package:ingredientsaver/constants/suffixes.dart';

import 'IngredientsDetailsPage.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key, this.category}) : super(key: key);
  final Category category;

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Category category;

  initState() {
    category = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: category.ingredients.length,
        itemBuilder: (BuildContext context, int index) {
          final ingredient = category.ingredients[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  IngredientsDetailsPage(ingredient: ingredient)));
            },
            child: ListTile(
              title: Text(ingredient.name),
              subtitle: Text("Expires on ${formatDateTimeString(ingredient.expirationDate)}"),
              trailing: Text("${ingredient.amount} ${ingredient.suffix}"),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var ingredient = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return MyDialog();
            }
          );

          if (ingredient != null) {
            this.setState(() => { category.ingredients.add(ingredient) });
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Ingredient _newIngredient = new Ingredient();
  final _formKey = GlobalKey<FormState>();
  final expirationDateController = new TextEditingController();
  final amountFocusNode = new FocusNode();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: false,
        actions: [
          KeyboardAction(
            focusNode: amountFocusNode,
            onTapAction: () {
              amountFocusNode.unfocus();
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
                        onTap: () => {
                          this.setState(() => {_newIngredient.suffix = index == 0 ? "" : suffixesList[index]})
                        },
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

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: _buildConfig(context),
      child: AlertDialog(
          title: Text("Add New Ingredient"),
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -80.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close, color: Colors.black,),
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Ingredient Name"
                        ),
                        onSaved: (value) => setState(() => { _newIngredient.name = value }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        focusNode: amountFocusNode,
                        keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                        decoration: InputDecoration(
                          labelText: "Amount",
                          suffixText: _newIngredient.suffix,
                        ),
                        onSaved: (value) => setState(() => { _newIngredient.amount = value }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        readOnly: true,
                        controller: expirationDateController,
                        onTap: () async {
                          var expirationDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now().subtract(new Duration(days: 365)),
                              lastDate: DateTime.now().add(new Duration(days: 730))
                          );
                          if (expirationDate != null) {
                            this.setState(() {
                              _newIngredient.expirationDate =
                                  expirationDate.toString();
                            });
                            expirationDateController.text =
                                formatDateTimeString(expirationDate.toString());
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.of(context).pop(_newIngredient);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}