import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';

import 'models/meal.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose': false,
    'vegan' : false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData ) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        return true;
      }).toList();
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DesiMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 254, 229,1),
        fontFamily: 'Raleway',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //   bodyText1: TextStyle(
        //     color: Color.fromRGBO(20, 51, 51, 1),
        //   ),
        //   // bodyText2: TextStyle(
        //   //   color: Color.fromRGBO(20, 51, 51, 1)
        //   // ),
        //   titleMedium: TextStyle(
        //     fontSize: 30,
        //     fontWeight: FontWeight.bold,
        //     fontFamily: 'RobotoCondensed'
        //   )
        // )
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/':(context) => TabScreen(),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName : (context) => MealDetailScreen(),
        FiltersScreen.routeName : (context) => FiltersScreen(_setFilters, _filters)
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        
        //return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}

