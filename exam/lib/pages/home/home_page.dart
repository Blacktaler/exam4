import 'package:dio/dio.dart';
import 'package:exam/core/configs/size_config.dart';
import 'package:exam/core/schema/recipe_schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/cookbook_item_widget.dart';
import 'components/home_appbar_widget.dart';
import 'components/recipe_title_widget.dart';
import 'components/recipe_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cookbookIndex = 0;

  List<RecipeSchema> _recipes = [];

  @override
  void initState() {
    super.initState();
    _getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: _recipes.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      CustomAppBar(
                        cookbookIndex: _cookbookIndex,
                      ),
                      SizedBox(
                        height: getHeight(247.0),
                        child: PageView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) =>
                              const CookbookItemWidget(),
                          onPageChanged: (int index) => setState(() {
                            _cookbookIndex = index;
                          }),
                        ),
                      ),
                      const RecipeTitleWidget(),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(16.0),
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => RecipeWidget(
                        recipe: _recipes[index],
                      ),
                      childCount: _recipes.length,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> _getRecipes() async {
    try {
      var response = await Dio().get("http://10.0.2.2:3000/recipe/");

      setState(() {
        _recipes = (response.data as List)
            .map(
              (recipe) => RecipeSchema.fromJson(recipe),
            )
            .toList();
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
