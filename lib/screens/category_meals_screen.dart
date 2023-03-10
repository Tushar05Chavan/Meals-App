import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     categoryTitle = routeArgs['title'];
    final CategoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(CategoryId);
    }).toList();
    _loadedInitData = true;
    }
    
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

void _removeMeal(String mealId) {
  setState(() {
    displayedMeals!.removeWhere((meal) => meal.id == mealId);
  });
}

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
              id: displayedMeals![index].id, 
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals!.length,
        ));
  }
}
