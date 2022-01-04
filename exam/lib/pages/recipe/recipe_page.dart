import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/recipe_bottom_widget.dart';
import 'components/recipe_center_widget.dart';
import 'components/recipe_top_widget.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RecipeTopWidget(),
            const RecipeCenterWidget(),
            SizedBox(
              height: getHeight(20.0),
            ),
            const RecipeBottomWidget(),
          ],
        ),
      ),
    );
  }
}