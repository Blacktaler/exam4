import 'package:exam/core/configs/size_config.dart';
import 'package:exam/pages/recipe/recipe_detail/ingredients.dart';
import 'package:exam/pages/recipe/recipe_detail/intro_part.dart';
import 'package:exam/pages/recipe/recipe_detail/steps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditRecipe extends StatefulWidget {
  @override
  State<EditRecipe> createState() => _EditRecipeState();
}

class _EditRecipeState extends State<EditRecipe> {
  List? forms;

  int _buttonIndex = 0;

  @override
  void initState() {
    forms = [Intro(), Ingredients(), Steps()];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getHeight(52),
              child: Row(
                children: [
                  buildButton(0, "Intro"),
                  buildButton(1, "Ingredients"),
                  buildButton(2, "Steps"),
                ],
              ),
            ),
            forms![_buttonIndex],
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: getHeight(60),
      leading: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return _dialog();
              });
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 15,
        ),
      ),
      title: Text(
        "Recipe Form",
        style: TextStyle(
          color: Colors.black,
          fontSize: getFont(20),
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Save",
            style: TextStyle(color: Colors.yellow, fontSize: getFont(16)),
          ),
        ),
      ],
    );
  }

  Widget buildButton(int index, String title) {
    Color textColor = Colors.grey;
    Color buttonColor = Colors.transparent;

    if (_buttonIndex == index) {
      textColor = Colors.white;
      buttonColor = Colors.orange;
    }

    return Expanded(
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: getHeight(8.0)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: buttonColor,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _buttonIndex = index;
          });
        },
      ),
    );
  }

  Widget _dialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: EdgeInsets.all(getWidth(24)),
      content: SizedBox(
        height: getHeight(125),
        child: Column(
          children: [
            Text(
              "Are you sure you want to go back?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getFont(20),
              ),
            ),
            SizedBox(
              height: getHeight(5),
            ),
            Text(
              "Any changes you made will be lost",
              style: TextStyle(
                fontSize: getFont(16),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.orange,
                fontSize: getFont(20),
              ),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Ok",
              style: TextStyle(
                color: Colors.orange,
                fontSize: getFont(20),
              ),
            )),
      ],
    );
  }
}
