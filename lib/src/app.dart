import 'package:flutter/material.dart';
import 'package:readathon/src/pages/login_signup_page.dart';
import 'package:readathon/src/screens/main_screen.dart';
//import 'package:readathon/src/screens/main_screen.dart';

class App extends StatelessWidget {
  // final MainModel mainModel = MainModel();
  final String authToken;
  App({this.authToken});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-Funza",
        theme: ThemeData(primaryColor: Colors.blue[100], fontFamily: 'Open Sans'),
        //home: MainScreen(),
        //home: SignInPage(),
        //home: new LoginSignupPage(),
        home: authToken  == "" ? LoginSignupPage() : MainScreen(),
    );
  }
}

