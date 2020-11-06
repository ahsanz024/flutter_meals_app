import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: 
        Text(
          this.title, 
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            this.color.withOpacity(0.7),
            this.color.withOpacity(1)
          ]
        )
      ),
    );
  }
}