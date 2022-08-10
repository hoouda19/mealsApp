import 'package:flutter/material.dart';
import 'package:meals_app/screen/meal_detail_screen.dart';
import './screen/tab_screen.dart';

import 'screen/category_meals_screen.dart';
import 'screen/category_screen.dart';
import 'screen/Filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (context) => const TabScreen(),
        CategoryMealsScreen.routepage: (context) => const CategoryMealsScreen(),
        MealDetailScreen.routepage: (context) => const MealDetailScreen(),
        FiltersScreen.routepage: (context) => const FiltersScreen(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: ((context) => const CategoryScreen())),
    );
  }
}
