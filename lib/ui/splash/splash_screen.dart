import 'dart:async';
import 'package:e_commerce/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  static const String routeName = 'splash' ;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2) , (){
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });

    return
        Scaffold(
          body:  Image.asset("assets/images/splash_screen.png" ,
            width: double.infinity ,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
            );

  }
}
