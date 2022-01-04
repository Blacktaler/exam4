import 'package:exam/core/configs/size_config.dart';
import 'package:exam/pages/home/home_page.dart';
import 'package:exam/pages/recipe/recipe_page.dart';
import 'package:exam/pages/search/search_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int activeIndex = 0;

  List<Widget> pages = [];

  @override
  void initState() {
    pages = [HomePage(), SearchPage(), RecipePage(), Container(), Container()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: pages[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "",
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: "",
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: activeIndex,
        onTap: (i) {
          activeIndex = i;
          setState(() {});
        },
      ),
    );
  }
}
