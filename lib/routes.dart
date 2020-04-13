import 'package:covid19/ui/home/home_screen.dart';
import 'package:covid19/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

/// Defines routes for the application which can be used via the [routes]
/// from outside the class
/// TODO :- Define it with the Tutorial Screens
class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String home = '/home';

  static final Map routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    home: (BuildContext context) => HomeScreen(),
  };
}
