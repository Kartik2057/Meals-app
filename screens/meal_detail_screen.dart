import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../dummy_data%20.dart';



class MealDetailScreen  extends StatelessWidget {
  final Function _toggleFavorite;
  final Function _isFavorite;


  
  static const routeName = '/meal-detail';
  MealDetailScreen(this._toggleFavorite,this._isFavorite);

  Widget buildSectionTitle(BuildContext context,String text){
    return Container(
      margin: EdgeInsets.symmetric(
        vertical:10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
        ),  
    );
  }

  Widget buildContainer (Widget child){
     return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
            ),
          height: 200,
          width: 300,
          child: child,
     );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = 
        ModalRoute.of(context).settings.arguments as String ;
    final selectedMeal = 
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(height: 300,
                    width: double.infinity,
                    child: Image.network(
                                          selectedMeal.imageUrl,
                                          fit: BoxFit.cover,
                                       )
                    ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 10),
          //   child: Text('Ingredients',
          //   style: Theme.of(context).textTheme.titleLarge,
          //   ),
          // ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(ListView.builder(
              itemBuilder: ((context, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                  ),
                  child: Text(selectedMeal.ingredients[index]
                  ),
                ),
              )
              ),
              itemCount: selectedMeal.ingredients.length,
              )
              ),
          buildSectionTitle(context,'Steps'),
          buildContainer(ListView.builder(
            itemBuilder: (context, index) => 
            Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${(index+1)}')
                    ),
                    title: Text(selectedMeal.steps[index]
                    ),
                ),
                Divider()
              ],
            ),
            itemCount: selectedMeal.steps.length,
            )
            )
        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(
          _isFavorite(mealId) 
          ? Icons.star
          :Icons.star_border,
          ),
          onPressed: () => _toggleFavorite(mealId), 
          ),
  );
  }
}