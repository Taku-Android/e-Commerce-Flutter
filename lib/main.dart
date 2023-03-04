import 'package:e_commerce/provider/app_config_provider.dart';
import 'package:e_commerce/ui/home/home_screen.dart';
import 'package:e_commerce/ui/login/login_screen.dart';
import 'package:e_commerce/ui/register/register_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => AppConfigProvider(),
      child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF004182),
            elevation: 0,
          ),
          primaryColor: const Color(0xFF004182),
          scaffoldBackgroundColor: const Color(0xFF004182)
      ),

      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }

}


