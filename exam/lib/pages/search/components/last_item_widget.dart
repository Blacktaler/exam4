
import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastItemWidget extends StatelessWidget {
  const LastItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
            getWidth(16.0),
          ),
          child: Row(
            children: [
              Container(
                width: getWidth(60.0),
                height: getWidth(60.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.red,
                ),
              ),
              SizedBox(
                width: getWidth(12.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resep Ayam Kuah Santan Pedas Lezat',
                  ),
                  SizedBox(
                    height: getHeight(8.0),
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.time,
                        size: getWidth(18.0),
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        width: getWidth(12.0),
                      ),
                      Text(
                        '40 min',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: getFont(14.0),
                        ),
                      ),
                      SizedBox(
                        width: getWidth(12.0),
                      ),
                      Icon(
                        CupertinoIcons.tortoise,
                        size: getWidth(18.0),
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        width: getWidth(12.0),
                      ),
                      Text(
                        'Easy',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: getFont(14.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 0.0,
        ),
      ],
    );
  }
}