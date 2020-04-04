import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LandingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Ingredient Saver',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color.fromRGBO(0xFF, 0xEB, 0x3b, 1),
        secondaryHeaderColor: Color.fromRGBO(0xC8, 0xB9, 0x00, 1),
        accentColor: Color.fromRGBO(0xFF, 0xFF, 0X72, 1)
      ),
      home: LandingPage(title: 'Ingredients Saver'),
    );
  }
}