import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';


class FavoritesScreen extends StatelessWidget {
  final List <Meal> _favouriteMeals;
  
  FavoritesScreen(this._favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(_favouriteMeals.isEmpty){
    return Center(
      child: Text('You have no favourites yet probably add one!'
      ),
    );
  }
  else{
      return ListView.builder(
        itemBuilder: (context, index)
        { 
          return MealItem(
              _favouriteMeals[index].id,
              _favouriteMeals[index].title,
              _favouriteMeals[index].imageUrl,
              _favouriteMeals[index].duration,
              _favouriteMeals[index].affordability,
              _favouriteMeals[index].complexity,
              );
        },
        itemCount: _favouriteMeals.length,
        );
  }
  }
}