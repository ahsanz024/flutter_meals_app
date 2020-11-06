import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': this.id,
        'title': this.title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        child: Center(
          child: Text(
            this.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        padding: EdgeInsets.all(10),
        decoration: boxDecoration,
      ),
    );
  }

  get boxDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          this.color.withOpacity(0.5),
          this.color.withOpacity(1),
        ],
      ),
    );
  }
}
