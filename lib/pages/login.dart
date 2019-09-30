import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      decoration: InputDecoration(
        labelText: 'Account Number',
        hintText: '123456',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7)
        )
      )
    );

    final passwordField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '******',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7)
        )
      )
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(7),
      color: Colors.redAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () { 
          Navigator.pushNamed(context, 'profile');
          // Navigator.push(context, SlideRight(page: Login()));
        },
        child: Text("Login",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold)
          ),
      ),
    );

    return new Scaffold(
        body: new Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 180.0,
                    child: Image.asset(  
                      "assets/genting-logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45.0), emailField,
                  SizedBox(height: 25.0), passwordField,
                  SizedBox(height: 35.0,), loginButton,
                  SizedBox(height: 15.0,),
                ],
              ),
            ),
          )
        )
      );
  } 
}