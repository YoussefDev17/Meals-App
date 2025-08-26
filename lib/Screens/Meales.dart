import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/Widgets/Meal_Item.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String title;

  MealsScreen({super.key, required this.meals, required this.title});

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(meal: meals[index]),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh Oh , Nothing Here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,

      /*       body: ListView(
        children:
            meals.map((meal) {
              return ListTile(
                title: Text(meal.title),
                subtitle: Text(meal.duration.toString() + ' min'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(meal.imageUrl),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selected Meal: ${meal.title}'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              );
            }).toList(),
      ), */
    );
  }
}
