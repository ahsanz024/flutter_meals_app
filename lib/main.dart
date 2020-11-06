import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          )
        )
      ),
      home: CategoryScreen(DUMMY_CATEGORIES),
    );
  }
}

