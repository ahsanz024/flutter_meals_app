import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (this.favouriteMeals.isEmpty) {
      return Text("Favourites Empty!");
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(favouriteMeals[index]);
      },
      itemCount: favouriteMeals.length,
    );
  }
}
