import 'package:flutter/material.dart';
/* import 'package:meals_app/Widgets/Filter_Card.dart';
import 'package:meals_app/Widgets/switch_Button.dart'; */

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluetenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  initState() {
    super.initState();
    _gluetenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegeterianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  Widget buildFilterListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function(bool newValue) updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );

    /*     SwitchListTile(
            value: _gluetenFreeFilterSet,
            onChanged: (bool isCheked) {
              setState(() {
                _gluetenFreeFilterSet = isCheked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ), */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _gluetenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegeterianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            buildFilterListTile(
              'Gluten-free',
              'Only include gluten-free meals.',
              _gluetenFreeFilterSet,
              (isCheked) {
                setState(() {
                  _gluetenFreeFilterSet = isCheked;
                });
              },
            ),
            buildFilterListTile(
              'Lactose-free',
              'Only include lactose-free meals.',
              _lactoseFreeFilterSet,
              (newValue) {
                setState(() {
                  _lactoseFreeFilterSet = newValue;
                });
              },
            ),
            buildFilterListTile(
              'Vegetarian',
              'Only include vegetarian meals.',
              _vegeterianFilterSet,
              (newValue) {
                setState(() {
                  _vegeterianFilterSet = newValue;
                });
              },
            ),
            buildFilterListTile(
              'Vegan',
              'Only include vegan meals.',
              _veganFilterSet,
              (newValue) {
                setState(() {
                  _veganFilterSet = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: const [
          filterCard(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            switchButton: SwitchButton(),
          ),
          filterCard(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            switchButton: SwitchButton(),
          ),
          filterCard(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            switchButton: SwitchButton(),
          ),
          filterCard(
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            switchButton: SwitchButton(),
          ),
        ],
      ),
    );
  }
}
 */
