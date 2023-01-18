import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(this.categoryId,  this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final CategoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(CategoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return MealItem(title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, affordability: categoryMeals[index].affordability);
      },
      itemCount: categoryMeals.length,
      )
    );
  }
}