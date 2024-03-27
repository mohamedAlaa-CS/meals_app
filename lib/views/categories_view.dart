import 'package:flutter/material.dart';
import 'package:meal_app/data/dammy_data.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/views/meals_view.dart';
import 'package:meal_app/widgets/grid_view_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.toggleFavorite});
  final void Function(MealModel meal) toggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        itemCount: availableCategories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              List<MealModel> filterList = dummyMeals
                  .where(
                    (meal) => meal.categories.contains(
                      availableCategories[index].id,
                    ),
                  )
                  .toList();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MealsView(
                  title: availableCategories[index].title,
                  items: filterList,
                  toggleFavorite: toggleFavorite,
                ),
              ));
            },
            splashColor: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            child: GrideViewItem(
              category: availableCategories[index],
            ),
          );
        },
      ),
    );
  }
}
