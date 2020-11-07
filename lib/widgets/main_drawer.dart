import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/category_meals_screen.dart';
import 'package:flutter_meals_app/screens/category_screen.dart';
import 'package:flutter_meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.amberAccent,
            padding: EdgeInsets.all(50),
            width: double.infinity,
            child: Text(
              "Cooking Up!!",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.redAccent,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          getRowItem(
            "Meals",
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          SizedBox(
            height: 10,
          ),
          getRowItem(
            "Filters",
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }

  Widget getRowItem(String label, IconData icon, Function func) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.grey[900]),
      ),
      onTap: func,
    );
  }
}
