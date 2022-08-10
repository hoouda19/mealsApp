import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'favorite_screen.dart';
import 'category_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Category',
      'page': const CategoryScreen(),
    },
    {
      'title': 'Category',
      'page': const FavoriteScreen(),
    }
  ];
  int _selectPageIndex = 0;
  void _counter(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _counter,
        items: const [
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}
