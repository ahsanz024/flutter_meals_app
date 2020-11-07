import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/category_screen.dart';
import 'package:flutter_meals_app/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab View View"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Category",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favourites",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
      initialIndex: 0,
    );
  }
}
