import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function isFavourite;
  final Function toggleFavourite;

  MealDetailsScreen(this.isFavourite, this.toggleFavourite);
  static const routeName = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map<String, Meal>;
    final meal = args['meal'];
    return Scaffold(
      appBar: AppBar(title: Text("${meal.title}")),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            titleContainer("Ingredients"),
            getIngredientsContent(context, meal.ingredients),
            titleContainer("Steps"),
            getSteps(context, meal.steps)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.toggleFavourite(meal.id);
        },
        child: this.isFavourite(meal.id)
            ? Icon(Icons.favorite_border)
            : Icon(Icons.favorite),
      ),
    );
  }

  Container titleContainer(String title) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      margin: EdgeInsets.only(top: 20, bottom: 10),
    );
  }

  Widget getIngredientsContent(BuildContext context, List<String> ingredients) {
    return borderedBoxBuilder(
      context,
      SingleChildScrollView(
        child: Column(
          children: ingredients.map((ing) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 3,
              ),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
                color: Colors.amberAccent,
              ),
              child: Text(
                ing,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget getSteps(BuildContext context, List<String> steps) {
    final themeData = Theme.of(context);
    return borderedBoxBuilder(
      context,
      ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: themeData.accentColor,
                  child: Text(
                    "#${index + 1}",
                    style: themeData.textTheme.bodyText1,
                  ),
                ),
                title: Text(
                  steps[index],
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ],
          );
        },
        itemCount: steps.length,
      ),
    );
  }

  Widget borderedBoxBuilder(BuildContext context, Widget child) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: boxDecoration,
      width: MediaQuery.of(context).size.width * 0.7,
      child: child,
    );
  }

  Decoration get boxDecoration {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey[500],
        width: 2,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      color: Colors.white,
    );
  }
}
