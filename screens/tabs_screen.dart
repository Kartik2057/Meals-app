import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';


class TabsScreen extends StatefulWidget {
  
  final List <Meal> _favouriteMeals;

  TabsScreen(this._favouriteMeals);
  @override
  TabsScreenState createState() =>  TabsScreenState();
}

class  TabsScreenState extends State <TabsScreen> {
  
  List <Map<String,Object>> _pages = [];
  
  int _selectedPageIndex = 0;

  void _selectPage(int index){
       setState(() {
           _selectedPageIndex = index;
       });
  }
  
  @override
  void initState() {
    _pages = [
    {'page':CategoriesScreen(),
     'title': 'Categories',
    },
    {'page':FavoritesScreen(widget._favouriteMeals), 
     'title': 'Your Favourites'
    },
  ];
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
        // bottom: TabBar(tabs: <Widget>[
        //   Tab(icon:Icon(
        //     Icons.category),
        //     text: 'Categories',
        //     ),
        //   Tab(icon: Icon(
        //       Icons.star,
        //   ),
        //   text: 'Favorites',
        //   ), 
        // ]
        // ),
        // body: TabBarView(
        //   children: <Widget>[
        //       CategoriesScreen(),
        //       FavoritesScreen(),
        //   ],
        // ),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          //This tells the bottom Navigation Bar which tab 
          //is selected.
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,

          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favourites',
            )
          ],
          ),
      );
  }
}