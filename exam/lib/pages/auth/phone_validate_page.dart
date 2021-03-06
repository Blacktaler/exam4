import 'package:dio/dio.dart';
import 'package:exam/core/configs/size_config.dart';
import 'package:exam/pages/auth/sign_up_page.dart';
import 'package:exam/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;
  String _phoneNumber = '';
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(),
        Container(
          width: cSize.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getHeight(42),
              ),
              _title(),
              SizedBox(height: getHeight(36)),
              _textFormField(),
              SizedBox(
                height: getHeight(15),
              ),
              _isLoading ? CircularProgressIndicator() : _elButton(),
              SizedBox(height: getHeight(40)),
              _pattern(),
              SizedBox(height: getHeight(36)),
              _appleSign(),
              SizedBox(
                height: getHeight(9),
              ),
              _signings(),
              SizedBox(height: getHeight(36)),
              _privacyPolicy(),
              SizedBox(
                height: getHeight(58),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _textFormField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: getHeight(3)),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: getWidth(16.0)),
          hintText: 'Phone Number',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        onChanged: (text) => _phoneNumber = text,
      ),
    );
  }

  Widget _title() {
    return Column(
      children: [
        Text(
          'Mallika',
          style: TextStyle(
            fontSize: getFont(39),
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          'Everyone can be a chef',
          style: TextStyle(fontSize: getFont(17)),
        ),
      ],
    );
  }

  Widget _elButton() {
    return ElevatedButton(
      onPressed: () {
        checkValidate();
      },
      child: Text("Send OTP"),
      style: ElevatedButton.styleFrom(
        primary: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        fixedSize: Size(
          getWidth(340),
          getHeight(48),
        ),
      ),
    );
  }

  Widget _pattern() {
    return Container(
      width: getWidth(340),
      // padding: EdgeInsets.symmetric(horizontal: getWidth(35)),
      child: Row(
        children: [
          SizedBox(
            width: getWidth(22),
          ),
          Expanded(
            child: Container(
              height: getHeight(1),
              color: Colors.grey,
            ),
          ),
          SizedBox(width: getWidth(7)),
          Text(
            "OR",
            style: TextStyle(fontSize: getFont(16), color: Colors.grey),
          ),
          SizedBox(width: getWidth(7)),
          Expanded(
            child: Container(
              height: getHeight(1),
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: getWidth(22),
          ),
        ],
      ),
    );
  }

  Widget _appleSign() {
    return Container(
      height: getHeight(50),
      width: cSize.width,
      padding: EdgeInsets.symmetric(horizontal: getWidth(18.0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: .7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getWidth(20.0),
            height: getWidth(20.0),
            child: Image.asset('assets/icons/apple.png'),
          ),
          Text('Continue with Apple'),
          SizedBox(),
        ],
      ),
    );
  }

  Widget _signings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: getWidth(165),
          height: getHeight(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: .7),
          ),
          padding: EdgeInsets.symmetric(horizontal: getWidth(18.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getWidth(20.0),
                height: getWidth(20.0),
                child: Image.asset('assets/icons/facebook.png'),
              ),
              Text('Facebook'),
              SizedBox(),
            ],
          ),
        ),
        Container(
          width: getWidth(165),
          height: getHeight(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: .7),
          ),
          padding: EdgeInsets.symmetric(horizontal: getWidth(18.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getWidth(20.0),
                height: getWidth(20.0),
                child: Image.asset('assets/icons/google.png'),
              ),
              Text('Google'),
              SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _privacyPolicy() {
    return Container(
      alignment: Alignment.center,
      width: cSize.width,
      height: getHeight(40),
      margin: EdgeInsets.symmetric(horizontal: 8),
      // padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        "By continuing, you agree to our\nTerms of service * Privacy Policy * Content Policy",
        style: TextStyle(
          color: Colors.black,
          fontSize: getFont(12),
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  isLogged()async{
   SharedPreferences shared = await SharedPreferences.getInstance();

   shared.getBool("isLogged");
   shared.setBool("isLogged", true);
  }

  void checkValidate() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var response = await Dio().post(
        'http://10.0.2.2:3000/users/checkvalidate',
        data: {
          "phone": int.parse(_phoneNumber),
        },
      );

      if (response.data["isExists"]) {
        var response = await Dio().post(
          'http://10.0.2.2:3000/users/signin',
          data: {
            "phone": int.parse(_phoneNumber),
          },
        );
        isLogged();
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
        print(response.data);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpPage(
              phoneNumber: _phoneNumber,
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
