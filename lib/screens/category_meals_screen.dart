import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catId = args["id"];
    final catTitle = args["title"];
    final catMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(catId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(catMeals[index].title);
          },
          itemCount: catMeals.length,
        ),
      ),
    );
  }
}
