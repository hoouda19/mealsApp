import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.favoriteMeal, {Key? key}) : super(key: key);
  final List<Meal> favoriteMeal;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
          child: Text('You Have No Favorite yet ,start adding some!'));
    } else {
      return Center(
        child: ListView.builder(
          itemBuilder: ((context, index) => MealItem(
                id: favoriteMeal[index].id,
                title: favoriteMeal[index].title,
                imageUrl: favoriteMeal[index].imageUrl,
                duration: favoriteMeal[index].duration,
                complexity: favoriteMeal[index].complexity,
                affordability: favoriteMeal[index].affordability,
              )),
          itemCount: favoriteMeal.length,
        ),
      );
    }
  }
}
