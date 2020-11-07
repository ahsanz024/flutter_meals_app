import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailsScreen.routeName,
      arguments: {
        'meal': this.meal,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(children: [topHalf, bottomHalf]),
      ),
    );
  }

  Widget get bottomHalf {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.hourglass_bottom),
              Text("${meal.duration}mins"),
            ],
          ),
          Row(
            children: [
              Icon(Icons.work),
              SizedBox(
                width: 5,
              ),
              Text("${describeEnum(meal.complexity)}"),
            ],
          ),
          Row(
            children: [
              Icon(Icons.attach_money),
              Text("${describeEnum(meal.affordability)}"),
            ],
          ),
        ],
      ),
    );
  }

  Widget get topHalf {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Image.network(
            meal.imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            width: 250,
            color: Colors.black54,
            child: Text(
              meal.title,
              textAlign: TextAlign.left,
              overflow: TextOverflow.fade,
              softWrap: true,
              style: TextStyle(
                fontSize: 26,
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
