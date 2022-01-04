import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditRecipe extends StatefulWidget {
  @override
  State<EditRecipe> createState() => _EditRecipeState();
}

class _EditRecipeState extends State<EditRecipe> {
  int _buttonIndex = 0;

  String dropDownV = "easy";

  List<String>? dropDownItems;
  List? forms;

  bool? _switchValue;
  @override
  void initState() {
    dropDownItems = [
      "easy",
      "medium",
      "difficult",
    ];
    _switchValue= false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    forms = [intro()];
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
            forms![0],
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
        onPressed: () {},
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

  Widget intro() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(16), vertical: getHeight(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: "Title",
                labelStyle: TextStyle(fontSize: getFont(14))),
          ),
          SizedBox(
            height: getHeight(28),
          ),
          Text(
            "Cook Time",
            style: TextStyle(fontSize: getFont(14), color: Colors.grey),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    labelText: "hours",
                    labelStyle:
                        TextStyle(fontSize: getFont(14), color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                width: getWidth(15),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    labelText: "minutes",
                    labelStyle:
                        TextStyle(fontSize: getFont(14), color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getHeight(54)),
          TextFormField(
            minLines: 1,
            maxLines: 20,
            decoration: InputDecoration(
              suffix: Icon(Icons.edit),
            ),
          ),
          SizedBox(height: getHeight(24)),
          Text(
            "Description",
            style: TextStyle(fontSize: getFont(14), color: Colors.grey),
          ),
          Text(
            "Membuat hidangan dengan bahan sayuran bisa jadi pilihan Sahabat Mallika. Sup makaroni dengan sayuran juga sangat cocok menu hidangan makan malam hari ini. Berikut bahan dan cara membuat sup makaroni. ",
            style: TextStyle(
              fontSize: getFont(14),
            ),
          ),
          SizedBox(height: getHeight(24)),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(14),),
                    Text(
                      "difficulty",
                      style:
                          TextStyle(color: Colors.grey, fontSize: getFont(14)),
                    ),
                    DropdownButton(
                      value: dropDownV,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: dropDownItems!.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownV = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TextFormField(
                initialValue: '2 people',
                decoration: InputDecoration(
                  labelText: "Serve",
                ),
              ))
            ],
          ),
          SizedBox(height: getHeight(24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("publish to Community",style: TextStyle(
                color: Colors.grey,
                fontSize: getFont(14)
              ),),
              CupertinoSwitch(value: _switchValue!, onChanged: (d){
                setState(() {
                  
                });
              }),
            ],
          )
        ],
      ),
    );
  }
}
