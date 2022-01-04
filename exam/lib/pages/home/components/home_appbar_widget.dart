import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final int cookbookIndex;
  const CustomAppBar({
    Key? key,
    required this.cookbookIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(16.0)),
      child: Column(
        children: [
          SizedBox(
            height: getHeight(16.0),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: 24.0,
              ),
              SizedBox(
                width: getWidth(16.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi Yach0'),
                  Text(
                    'What are you cooking today?',
                    style: TextStyle(
                      fontSize: getFont(14.0),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: getHeight(16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cookbooks',
                style: TextStyle(
                  fontSize: getFont(24.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${cookbookIndex + 1}/3',
                style: TextStyle(
                  fontSize: getFont(14.0),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
