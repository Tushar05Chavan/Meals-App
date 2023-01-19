import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Center(
        child: Text('The Meal!'),
      ),
    );
  }
}