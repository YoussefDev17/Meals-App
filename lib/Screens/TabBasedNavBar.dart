import 'package:flutter/material.dart';
import 'package:meals_app/Screens/Categories.dart';
import 'package:meals_app/Screens/Meales.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/Widgets/mainDrawr.dart';
import 'package:meals_app/Screens/Filters.dart';
import 'package:meals_app/Data/Dummy_Data.dart';

const KInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends StatefulWidget {
  TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> favoritesMeales = [];
  List<Meal> filteredMeals = [];
  Map<Filter, bool> _selectedFilters = KInitialFilters;

  void _setScreen(String identifer) async {
    Navigator.of(context).pop();
    if (identifer == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(currentFilters: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = result ?? KInitialFilters;
      });

      //print(result);
    }
  }

  void _updateList(Meal meal) {
    bool isExist = favoritesMeales.contains(meal);
    if (isExist) {
      setState(() {
        favoritesMeales.remove(meal);
        _ShowInfoMessage('Meal Removed from Favorites');
      });
    } else {
      setState(() {
        favoritesMeales.add(meal);
        _ShowInfoMessage('Meal Added to Favorites');
      });
    }
  }

  void _ShowInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    filteredMeals =
        dummyMeals.where((meal) {
          if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
            return false;
          }
          if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
            return false;
          }
          if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
            return false;
          }
          if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
            return false;
          }
          return true;
        }).toList();

    Widget currentScreen = CtaegoriesScreen(
      onToggleFavorite: _updateList,
      availableMeals: filteredMeals,
    );
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      currentScreen = MealsScreen(
        meals: favoritesMeales,
        onSelect: _updateList,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawr(onSelectScreen: _setScreen),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
