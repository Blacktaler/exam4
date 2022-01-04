import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CookbookItemWidget extends StatelessWidget {
  const CookbookItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(16.0)),
      child: Container(
        padding: EdgeInsets.all(getWidth(16.0)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getWidth(42.0),
              height: getWidth(42.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange,
                ),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.cake_rounded,
                color: Colors.orange,
              ),
            ),
            Text(
              'Buku resep spesial antara',
              style: TextStyle(
                fontSize: getFont(24.0),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: getHeight(12.0),
            ),
            Text(
              'Keep it easy with these simple\nbut delicious recipes.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getFont(16.0),
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: getHeight(12.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('1,3k  Likes'),
                Text('7  Recipes'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
