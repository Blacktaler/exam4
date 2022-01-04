import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class RecipeTitleWidget extends StatelessWidget {
  const RecipeTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(16.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getHeight(16.0),
          ),
          Text(
            'Featured Community Recipes',
            style: TextStyle(
              fontSize: getFont(24.0),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Get lots of recipe inspiration from the community',
            style: TextStyle(
              fontSize: getFont(14.0),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
