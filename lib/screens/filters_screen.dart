import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function _updateFilters;
  final Map<String, bool> _filters;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();

  FiltersScreen(
    this._filters,
    this._updateFilters,
  );
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  void _saveFilters() {
    widget._updateFilters(
      {
        'gluten': _glutenFree,
        'lactose': _lactoseFree,
        'vegan': _isVegan,
        'vegetarian': _isVegetarian,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _glutenFree = widget._filters['gluten'];
    _lactoseFree = widget._filters['lactose'];
    _isVegan = widget._filters['vegan'];
    _isVegetarian = widget._filters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveFilters,
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Center(
              child: Text(
            "Meal Preferences",
            style: Theme.of(context).textTheme.headline6,
          )),
          Expanded(
              child: ListView(
            children: [
              listItem(
                "Gluten Free",
                "Do you want to see gluten free meals?",
                _glutenFree,
                (newValue) {
                  this.setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              listItem(
                "Lactose Free",
                "Do you want to see lactose free meals?",
                _lactoseFree,
                (newValue) {
                  this.setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              listItem(
                "Vegetarian Meal",
                "Do you want to see vegetarian meals?",
                _isVegetarian,
                (newValue) {
                  this.setState(() {
                    _isVegetarian = newValue;
                  });
                },
              ),
              listItem(
                "Vegan Meal",
                "Do you want to see Vegan meals?",
                _isVegan,
                (newValue) {
                  this.setState(() {
                    _isVegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget listItem(
      String title, String subTitle, bool value, Function changeListner) {
    return SwitchListTile(
      value: value,
      onChanged: (newValue) => changeListner(newValue),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
