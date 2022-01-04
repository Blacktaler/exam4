
import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeTopWidget extends StatelessWidget {
  const RecipeTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(408.0),
      padding: EdgeInsets.only(
        top: getHeight(60.0),
        left: getWidth(16.0),
        right: getWidth(16.0),
      ),
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: getWidth(40.0),
                height: getWidth(40.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                ),
              ),
              Container(
                width: getWidth(40.0),
                height: getWidth(40.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  CupertinoIcons.heart,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: getWidth(16.0),
              left: getWidth(16.0),
              right: getWidth(16.0),
              bottom: getWidth(9.0),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: getWidth(8.0),
                horizontal: getWidth(16.0),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cookbooks / Menu ayam spesial',
                    style: TextStyle(
                      fontSize: getFont(14.0),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    width: getWidth(24.0),
                    height: getWidth(24.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}