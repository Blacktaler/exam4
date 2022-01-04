
import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTextWidget extends StatelessWidget {
  const RecentTextWidget({
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sayur',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.clear),
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
