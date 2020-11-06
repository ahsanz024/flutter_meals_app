import 'package:flutter/material.dart';
import 'package:flutter_meals_app/category_item.dart';
import 'package:flutter_meals_app/models/category.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = "/";

  final List<Category> categories;

  CategoryScreen(this.categories);

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
        children: this
            .categories
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
