import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
   FiltersScreen(this.saveFilters, this.currentFilters);

  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement ini
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  // ignore: unused_element
  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(onPressed: () {
          final selectedFilters = {
    'gluten' : _glutenFree,
    'lactose': _lactoseFree,
    'vegan' : _vegan,
    'vegetarian': _vegetarian,
  };
            widget.saveFilters(selectedFilters);}, icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                  title: Text('Gluten-Free'),
                  value: _glutenFree,
                  subtitle: Text('Only include gluten-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  SwitchListTile(
                  title: Text('Lactose-Free'),
                  value: _lactoseFree,
                  subtitle: Text('Only include lactose-free meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  SwitchListTile(
                  title: Text('Vegetarian'),
                  value: _vegetarian,
                  subtitle: Text('Only include Vegetarian meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  SwitchListTile(
                  title: Text('Vegan'),
                  value: _vegan,
                  subtitle: Text('Only include Vegan meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
