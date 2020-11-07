import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/category_screen.dart';
import 'package:flutter_meals_app/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [
    CategoryScreen(),
    FavouritesScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
        ],
        onTap: selectItem,
        backgroundColor: themeData.primaryColor,
        selectedItemColor: Colors.purple[300],
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
      ),
      appBar: AppBar(
        title: Text("Meals App"),
      ),
      body: _pages[_selectedIndex],
    );
  }

  void selectItem(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
