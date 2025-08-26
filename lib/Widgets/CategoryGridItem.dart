import 'package:flutter/material.dart';
//import 'package:meals_app/main.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final category categoryItem;
  final void Function() OnSelected;

  const CategoryGridItem({
    super.key,
    required this.categoryItem,
    required this.OnSelected,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnSelected,

      splashColor: Theme.of(context).primaryColor,

      child: Container(
        width: double.infinity,
        height: double.infinity,
        //color: categoryItem.color,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //categoryItem.color.withValues(0.7),
              // categoryItem.color.withValues(),
              categoryItem.color.withValues(alpha: 0.9),
              categoryItem.color.withValues(alpha: 0.55),
              // categoryItem.color.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          categoryItem.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
