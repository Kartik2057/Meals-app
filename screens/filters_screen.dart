import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters'; 

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  
  
  FiltersScreen(this.currentFilters,this.saveFilters);

  
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree=false;
  bool _vegetarian =false;
  bool _vegan =false;
  bool _lactoseFree =false;
  
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }
  
  Widget _buildSwitchListTile(
    String title, 
    String subtitle, 
    bool currentValue,
    Function updateValue
    ){
      return SwitchListTile(
                  title: Text(title
                  ),
                  value: currentValue,
                  subtitle: 
                  Text(subtitle
                  ),
                  onChanged: updateValue,
                  );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'
        ),
        actions: <Widget>[
          IconButton(
             onPressed: () {
             final selectedFilters ={
              'gluten' : _glutenFree,
              'lactose': _lactoseFree,
              'vegan' : _vegan,
              'vegetarian' : _vegetarian,
             };
             widget.saveFilters(selectedFilters);
             },
             icon: Icon(Icons.save
             ),
             )
        ],
      ),
      body:Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust Your Meal Selection',
            style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free','Only include gluten-free food.',
                    _glutenFree, 
                   (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    }
                    );
                   }
                   ),
                _buildSwitchListTile(
                  'Lactose-free','Only include lactose-free food.',
                    _lactoseFree, 
                   (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    }
                    );
                   }
                   ),
                _buildSwitchListTile(
                  'Vegeterian','Only include vegetarian food.',
                    _vegetarian, 
                   (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    }
                    );
                   }
                   ),
                _buildSwitchListTile(
                  'Vegan','Only include vegan food.',
                    _vegan, 
                   (newValue) {
                    setState(() {
                      _vegan = newValue;
                    }
                    );
                   }
                   ),
              ],
            ),
            )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}