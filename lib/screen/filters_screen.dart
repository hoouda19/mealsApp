import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen(this.currentFilters, this._saveFilters);

  static const routepage = '/filters';
  final Function _saveFilters;

  final Map<String, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget.currentFilters['Gluten']!;
    isVegan = widget.currentFilters['Vegan']!;
    isVegetarian = widget.currentFilters['Vegetarian']!;
    isLactoseFree = widget.currentFilters['Lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, dynamic updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> filters = {
                  'Gluten': isGlutenFree,
                  'Vegan': isVegan,
                  'Vegetarian': isVegetarian,
                  'Lactose': isLactoseFree,
                };
                widget._saveFilters(filters);
              },
              icon: const Icon(Icons.save))
        ],
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust Your Meal Selection',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView(children: [
            _buildSwitchListTitle(
                'GlutenFree', 'only include glutenfree meals', isGlutenFree,
                (value) {
              setState(() {
                isGlutenFree = value;
              });
            }),
            _buildSwitchListTitle('Vegan', 'only include Vegan meals', isVegan,
                (value) {
              setState(() {
                isVegan = value;
              });
            }),
            _buildSwitchListTitle(
                'Vegetarian', 'only include Vegetarian meals', isVegetarian,
                (value) {
              setState(() {
                isVegetarian = value;
              });
            }),
            _buildSwitchListTitle(
                'LactoseFree', 'only include LactoseFree meals', isLactoseFree,
                (value) {
              setState(() {
                isLactoseFree = value;
              });
            }),
          ]),
        )
      ]),
    );
  }
}
