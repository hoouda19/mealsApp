import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screen/meal_detail_screen.dart';
import './screen/tab_screen.dart';
import 'screen/category_meals_screen.dart';
import 'screen/category_screen.dart';
import 'screen/Filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'Vegan': false,
    'Vegetarian': false,
    'Lactose': false,
  };

  void _setFilters(Map<String, bool> _filtersData) {
    _filters = _filtersData;
    _availableMeal = DUMMY_MEALS.where((meal) {
      if (_filters['Gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['Vegan']! && !meal.isVegan) {
        return false;
      }
      if (_filters['Vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      if (_filters['Lactose']! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();
  }

  List<Meal> _availableMeal = DUMMY_MEALS;
  final List<Meal> _favoriteMeal = [];

  void _toggleFavorite(String mealId) {
    final existingindex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingindex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingindex);
      });
    } else {
      setState(() {
        _favoriteMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeal.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        //accentColor: Colors.amber,
        //canvasColor: const Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            // bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      //home: const CategoryScreen(),
      routes: {
        '/': (context) => TabScreen(_favoriteMeal),
        CategoryMealsScreen.routepage: (context) =>
            CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routepage: (context) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        FiltersScreen.routepage: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: ((context) => const CategoryScreen())),
    );
  }
}
