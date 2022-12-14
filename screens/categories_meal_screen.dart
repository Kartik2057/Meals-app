import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';


class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId,this.categoryTitle);
  //This is just acting like an address for flutter to display this page
  static const routeName = '/category-meals';
  final List <Meal> availableMeals;
  
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List <Meal> displayedMeals;
  var _loadedInitData = false;

  
  @override
  void initState() {

    super.initState();
  }

  
  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
    final routeArgs = 
    ModalRoute.of(context).settings.arguments as Map<String,String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
    _loadedInitData =true;
    }
  }


  void _removeMeal(String mealId){
     setState(() {
       displayedMeals.removeWhere(
        (meal) => meal.id == mealId
        );
     });
  }
  
  
  @override
  Widget build(BuildContext context) {
    //
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index)
        { 
          return MealItem(
              displayedMeals[index].id,
              displayedMeals[index].title,
              displayedMeals[index].imageUrl,
              displayedMeals[index].duration,
              displayedMeals[index].affordability,
              displayedMeals[index].complexity,
              );
        },
        itemCount: displayedMeals.length,
        )
    );
  }
}