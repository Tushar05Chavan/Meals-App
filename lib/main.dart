import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName : (context) => MealDetailScreen(),
        FiltersScreen.routeName : (context) => FiltersScreen()
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

