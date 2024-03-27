import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onselectedMeal,
  });
  final MealModel meal;
  final Function(MealModel meal) onselectedMeal;
  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';

      case Complexity.challenging:
        return 'challenging';

      case Complexity.hard:
        return 'Hard';

      default:
        return 'unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onselectedMeal(meal),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 3,
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                ),
                Positioned(
                  bottom: 20,
                  left: 25,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                    ),
                    child: Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    const Icon(Icons.schedule),
                    const SizedBox(width: 6),
                    Text('${meal.duration} min'),
                  ]),
                  Row(children: [
                    const Icon(Icons.work),
                    const SizedBox(width: 6),
                    Text(complexityText),
                  ]),
                  Row(children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(width: 6),
                    Text(affordabilityText),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
