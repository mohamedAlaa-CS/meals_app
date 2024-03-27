import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';

class MealDetailsiew extends StatelessWidget {
  const MealDetailsiew(
      {super.key, required this.meal, required this.toggleFavorite});
  final MealModel meal;
  final void Function(MealModel meal) toggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => toggleFavorite(meal),
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          const Text(
            'ingredients',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (final ingredients in meal.ingredients) ...{Text(ingredients)},
          const SizedBox(height: 15),
          const Text(
            'steps',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          for (final step in meal.steps) ...{
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(step, textAlign: TextAlign.center),
            )
          }
        ]),
      ),
    );
  }
}
