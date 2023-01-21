import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(text, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'
          )),
        );
  }

  Widget buildContainer(Widget child){
    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 150,
          width: 300,
          child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId,);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedmeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedmeal.imageUrl, fit: BoxFit.cover,),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical : 5.0, horizontal: 10),
                  child: Text(selectedmeal.ingredients[index]),
                ),
              ),
              itemCount: selectedmeal.ingredients.length,
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          buildContainer(
            ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child:  Text('# ${(index + 1)}'),
                    ),
                    title: Text(selectedmeal.steps[index],
                    ),
                  ),
                  Divider(),
                ],
              ),
          itemCount: selectedmeal.steps.length,
          ))
        ],),
      )
    );
  }
}