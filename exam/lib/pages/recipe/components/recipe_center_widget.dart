

import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeCenterWidget extends StatelessWidget {
  const RecipeCenterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(16.0),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: getWidth(8.0),
          left: getWidth(16.0),
          right: getWidth(16.0),
          bottom: getWidth(16.0),
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              'Sup Makaroni Daging Ayam Kampung',
              style: TextStyle(
                fontSize: getFont(24.0),
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: getHeight(16.0),
            ),
            Row(
              children: [],
            ),
            SizedBox(
              height: getHeight(16.0),
            ),
            Divider(height: 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      color: Colors.orange,
                    ),
                    Text('40 min'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      CupertinoIcons.tornado,
                      color: Colors.orange,
                    ),
                    Text('Easy'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      CupertinoIcons.tortoise,
                      color: Colors.orange,
                    ),
                    Text('Serves 2'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
