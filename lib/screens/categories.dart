import 'package:flutter/material.dart';
import 'package:pocnav/data/dummy_data.dart';
import 'package:pocnav/models/category.dart';
import 'package:pocnav/models/meal.dart';
import 'package:pocnav/screens/meals.dart';
import 'package:pocnav/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext ctx, Category category) {
    final filteredMeals = availableMeals
        .where((m) => m.categories.contains(category.id))
        .toList();

    Navigator.push(
        ctx,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: category.title,
                  meals: filteredMeals,
                  onToggleFavorite: onToggleFavorite,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      padding: const EdgeInsets.all(24),
      children: [
        for (final c in availableCategories)
          CategoryGridItem(
            category: c,
            onSelectCategory: () {
              _selectCategory(context, c);
            },
          )
      ],
    );
  }
}
