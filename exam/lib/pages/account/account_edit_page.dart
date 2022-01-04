import 'package:exam/core/configs/size_config.dart';
import 'package:flutter/material.dart';

class AccountEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(
              color: Colors.black,
              fontSize: getFont(20),
              fontWeight: FontWeight.w600),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          size: 15,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _makePhoto(),
            _makeTextField("Profile Name", "Narayana Kirana"),
            _makeTextField("Email", "email@gmail.com"),
            _makeTextField("Phone Number", "+998998530313"),
            _makeTextField("Bio", "Lorem Ipsum"),
            SizedBox(
              height: cSize.height * .15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Save Changes"),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    getWidth(300),
                    getHeight(52),
                  ),
                  primary: Colors.orange),
            )
          ],
        ),
      ),
    );
  }

  Widget _makeTextField(String status, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(16.0), vertical: getHeight(8.0)),
      child: Column(
        children: [
          Divider(),
          TextFormField(
            initialValue: title,
            decoration: InputDecoration(
              labelText: status,
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: getFont(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _makePhoto() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getHeight(8),
        horizontal: getWidth(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
          ),
          SizedBox(width: getWidth(15)),
          TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.photo_camera,
                color: Colors.orange,
              ),
              label: Text(
                "Edit Photo",
                style: TextStyle(color: Colors.orange, fontSize: getFont(16)),
              ))
        ],
      ),
    );
  }
}
