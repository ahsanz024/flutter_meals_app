import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  final List<Meal> _filteredMeals;

  CategoryMealsScreen(this._filteredMeals);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catId = args["id"];
    final catTitle = args["title"];
    final catMeals = _filteredMeals
        .where((meal) => meal.categories.contains(catId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(catMeals[index]);
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
