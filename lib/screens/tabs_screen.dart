import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/category_screen.dart';
import 'package:flutter_meals_app/screens/favourites_screen.dart';
import 'package:flutter_meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/";

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [
    {'page': CategoryScreen(), 'title': "Categories"},
    {'page': FavouritesScreen(), 'title': 'Favourites'},
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: themeData.primaryColor,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: themeData.primaryColor,
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
        ],
        onTap: selectItem,
        backgroundColor: themeData.primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
      ),
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["title"]),
      ),
      body: _pages[_selectedIndex]["page"],
      drawer: MainDrawer(),
    );
  }

  void selectItem(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
