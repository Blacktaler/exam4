import 'package:exam/pages/account/account_edit_page.dart';
import 'package:exam/pages/app/app.dart';
import 'package:exam/pages/auth/phone_validate_page.dart';
import 'package:exam/pages/grocery/grocery_page.dart';
import 'package:exam/pages/recipe/recipe_detail/edit_recipe.dart';
import 'package:exam/pages/recipe/recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: AccountEdit(
        
      ),
    );
  }

  isLogged() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    bool? isLog = shared.getBool("isLogged") ?? false;
    shared.setBool("isLogged", true);
    return isLog;
  }
}
