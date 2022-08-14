import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routepage = '/category_meals';
  const CategoryMealsScreen(this.availableMeal);
  final List<Meal> availableMeal;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = '';
  List<Meal> displayedMeals = [];
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArg =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArg['title']!;
      final categoryId = routeArg['id'];
      displayedMeals = widget.availableMeal
          .where(
            (meal) => meal.categories.contains(categoryId),
          )
          .toList();
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  _removeItem(mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: ((context, index) => MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                affordability: displayedMeals[index].affordability,
              )),
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
