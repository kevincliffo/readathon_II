import 'package:flutter/material.dart';
import "package:readathon/src/app.dart";
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
  String authToken = _sharedPrefs.getString("auth_token") ?? "";
  // authToken = "";
  print('authToken : $authToken');
  runApp(App(authToken:authToken));
}