import 'package:flutter/material.dart';
import 'package:genting_recognition/pages/profile.dart';
import 'package:genting_recognition/pages/scan.dart';
import 'package:genting_recognition/pages/splash_screen.dart';
import 'package:genting_recognition/pages/login.dart';

void main() {
  runApp(new Routes());
}

final ThemeData _themeData = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.redAccent,
  accentColor: Colors.white,
  fontFamily: 'Montserrat',
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.redAccent,     //  <-- dark color
    textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
  )
);

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: _themeData,
      home: SplashScreen(),
      routes: <String, WidgetBuilder> {
        'login': (BuildContext context) => new Login(), 
        'profile': (BuildContext context) => new Profile(),
        'scan': (BuildContext context) => new Scan() 
      }
    );
  }
}