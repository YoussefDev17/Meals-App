import 'package:flutter/material.dart';
import 'package:meals_app/Data/Dummy_Data.dart';
import 'package:meals_app/Widgets/CategoryGridItem.dart';
import 'package:meals_app/Screens/Meales.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/Meal.dart';

class CtaegoriesScreen extends StatelessWidget {
  const CtaegoriesScreen({super.key, required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, category categoryItem) {
    final filteredMeals =
        dummyMeals
            .where((meal) => meal.categories.contains(categoryItem.id))
            .toList();
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder:
            (context) => MealsScreen(
              meals: filteredMeals,
              title: categoryItem.title,
              onSelect: onToggleFavorite,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            categoryItem: category,
            OnSelected: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
    
  

      // Answer buttons
          // ...questions[currentQuestionIndex].answers.map((answer) {
          //   return buildAnswerButton(answer, getAnswerButtonState(answer));
          // }).toList(),
