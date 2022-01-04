import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  String dropDownV = "easy";

  List<String>? dropDownItems;

  bool? _switchValue;
  @override
  void initState() {
    dropDownItems = [
      "easy",
      "medium",
      "difficult",
    ];
    _switchValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(16), vertical: getHeight(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          top(),
          SizedBox(height: getHeight(24)),
          center(),
          SizedBox(height: getHeight(24)),
          bottom()
        ],
      ),
    );
  }

  Widget top() {
    return Column(
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
      ],
    );
  }

  Widget center() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  SizedBox(
                    height: getHeight(14),
                  ),
                  Text(
                    "difficulty",
                    style: TextStyle(color: Colors.grey, fontSize: getFont(14)),
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
      ],
    );
  }

  Widget bottom(){
    return Column(
      children:[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "publish to Community",
                style: TextStyle(color: Colors.grey, fontSize: getFont(14)),
              ),
              CupertinoSwitch(
                  value: _switchValue!,
                  onChanged: (d) {
                    setState(() {
                      _switchValue = d;
                      setState(() {});
                    });
                  }),
            ],
          ),
          SizedBox(height: getHeight(24)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "source",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: "URL",
                hintText: "https://www.fimela.com/lifestyle-relationsh"),
          ),
      ]
    );
  }
}
