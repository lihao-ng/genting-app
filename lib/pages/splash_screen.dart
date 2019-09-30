import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, 'login')
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
          child: SizedBox(
            height: 180.0,
            child: Image.asset(  
              "assets/genting-logo.png",
              fit: BoxFit.contain
            ),
          ),
        )
      )
    );
  }
}