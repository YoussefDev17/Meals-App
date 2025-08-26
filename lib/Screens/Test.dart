import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/Meal_Item.dart';
import 'package:meals_app/Data/Dummy_Data.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MealItem(meal: dummyMeals[0]));
  }
}
