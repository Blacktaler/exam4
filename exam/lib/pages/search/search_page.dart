import 'package:dio/dio.dart';
import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/last_item_widget.dart';
import 'components/recent_text_widget.dart';
import 'components/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<void> _getRecipes() async {
    try {
      var response = await Dio().get("http://10.0.2.2:3000/recipe/");
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search Recipe',
          style: TextStyle(
            fontSize: getFont(20.0),
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.1,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SearchWidget(),
                Padding(
                  padding: EdgeInsets.all(
                    getWidth(16.0),
                  ),
                  child: Text(
                    'Recent Search',
                    style: TextStyle(
                      fontSize: getFont(24.0),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => RecentTextWidget(),
              childCount: 2,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(
                    getWidth(16.0),
                  ),
                  child: Text(
                    'Last Seen',
                    style: TextStyle(
                      fontSize: getFont(24.0),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => LastItemWidget(),
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
