import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/views/meal_details_view.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsView extends StatelessWidget {
  const MealsView({
    super.key,
    this.title,
    required this.items,
    required this.toggleFavorite,
  });
  final String? title;
  final List<MealModel> items;
  final void Function(MealModel meal) toggleFavorite;
  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: items
            .map((meal) => MealItem(
                  meal: meal,
                  onselectedMeal: (MealModel meal) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MealDetailsiew(
                          meal: meal,
                          toggleFavorite: toggleFavorite,
                        ),
                      ),
                    );
                  },
                ))
            .toList(),
      ),
    );
  }
}
