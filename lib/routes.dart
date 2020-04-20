import 'package:flutter/material.dart';
import 'package:covid19/ui/prevention/prevention_screen.dart';
import 'package:covid19/ui/splash/splash_screen.dart';
import 'package:covid19/ui/symptomChecker/symptom_checker_screen.dart';

/// Defines routes for the application which can be used via the [routes]
/// from outside the class
/// TODO :- Define it with the Tutorial Screens
class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String symptomChecker = '/symptomChecker';
  static const String prevention = '/prevention';

  static final Map routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    symptomChecker: (BuildContext context) => SymptomCheckerScreen(),
    prevention: (BuildContext context) => PreventionScreen(),
  };
}
