import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class GroceryPage extends StatefulWidget {
  @override
  State<GroceryPage> createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  int listlength = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Grocery",
          style: TextStyle(
            color: Colors.black,
            fontSize: getFont(20),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => _dialog(context),
              );
            },
            icon: const Icon(Icons.delete),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        padding:
            EdgeInsets.fromLTRB(getWidth(16), getHeight(17), getWidth(16), 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: " Add new item",
                filled: true,
                fillColor: Colors.blueGrey[100],
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
              ),
            ),
            Divider(),
          listlength>0 ? _recipeList(): _emptyList(),
          ],
        ),
      ),
    );
  }

  Widget _recipeList(){
    return             Expanded(
              child: ListView.builder(
                  itemCount: listlength,
                  shrinkWrap: true,
                  itemBuilder: (_, __) {
                    return Container(
                      child: Column(
                        children: [
                          Text(
                            "Recipe title",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getFont(20)),
                          ),
                          Text(
                            "  Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut non assumenda, rem molestiae incidunt laborum, et voluptatum consectetur praesentium delectus neque iure culpa. Qui, voluptate? Deserunt aut minima maxime. Ipsa, necessitatibus dolor facilis laborum a cum autem dolores deleniti ullam, accusamus eos hic illo dolorem nesciunt. Suscipit corrupti quis maxime esse sint? Commodi harum laborum nihil id quaerat autem adipisci tempora recusandae temporibus rerum quis odit officiis reprehenderit impedit nobis aspernatur soluta, fugiat quasi minima illum est dolor delectus aliquid. Beatae rem fuga sequi neque molestiae. Ea voluptatibus, nesciunt perspiciatis at dolor laudantium atque! Non nulla fugit consectetur esse architecto.",
                            style: TextStyle(
                              fontSize: getFont(16),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            );
  }

  Widget _dialog(BuildContext context) {
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
              listlength = 0;
              setState(() {});
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

  Widget _emptyList(){
    return Center(
      child: Column(
        
        children: [SizedBox(height: getHeight(100),),Icon(Icons.local_grocery_store_outlined,size: getFont(45),),Text("Grocery is empty",style: TextStyle(fontSize: getFont(20),fontWeight: FontWeight.w600),)],
      ),
    );
  }
}
