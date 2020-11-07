import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import 'package:flutter_meals_app/widgets/category_item.dart';
import 'package:flutter_meals_app/models/category.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = "/";

  CategoryScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((item) => CategoryItem(
                  id: item.id,
                  title: item.title,
                  color: item.color,
                ))
            .toList(),
      ),
    );
  }
}
