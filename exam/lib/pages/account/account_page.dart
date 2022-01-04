import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(getWidth(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Padding(
              padding: EdgeInsets.all(getWidth(8)),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(getWidth(8)),
                  height: getHeight(80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.black87,
                      ),
                      Text(
                        "Liced Recipe",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(getWidth(8)),
                  height: getHeight(80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.black87,
                      ),
                      Text(
                        "Notifications",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(getWidth(8)),
                  height: getHeight(80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        CupertinoIcons.settings,
                        color: Colors.black87,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
             Padding(
              padding: EdgeInsets.all(getWidth(8.0)),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            
            Container(
              padding: EdgeInsets.only(left: getWidth(12)),
              height: getHeight(50),
              child:  Text(
                "General",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getFont(20),
                    fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
              onPressed: () {},
              child: _buildButton("About"),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
              onPressed: () {},
              child: _buildButton("Help & Support"),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
              onPressed: () {},
              child: _buildButton("Send Feedback"),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
              onPressed: () {},
              child: _buildButton("Rate Us"),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
              onPressed: () {},
              child: _buildButton("Check for Update"),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildButton(String? titlega) {
    return Container(
      height: getHeight(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$titlega",
            style: TextStyle(color: Colors.black),
          ),
          const Icon(
            CupertinoIcons.forward,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
