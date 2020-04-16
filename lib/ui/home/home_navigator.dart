import 'package:flutter/material.dart';
import 'package:covid19/ui/home/home_screen.dart';
import 'package:covid19/ui/statistics/statistics_screen.dart';
import 'package:covid19/ui/prevention/prevention_screen.dart';
import 'package:covid19/ui/symptomChecker/symptom_checker_screen.dart';

/// States for [HomeRoutes]
enum HomeRoutes { home, latestNumbers, prevention, symptomChecker }

/// [HomeRoutesDefinitions] to map the appropriate states of [HomeRoutes]
/// to paths
extension HomeRouteDefinitions on HomeRoutes {
  String get name {
    switch (this) {
      case HomeRoutes.home:
        return '/';
      case HomeRoutes.latestNumbers:
        return '/latest-numbers';
      case HomeRoutes.prevention:
        return '/prevention';
      case HomeRoutes.symptomChecker:
        return '/symptom-checker';
      default:
        return '/';
    }
  }

  /// [HomeRoutes] to decode the appropriate paths to [HomeRoutes]
  static HomeRoutes fromString(String str) {
    switch (str) {
      case '/':
        return HomeRoutes.home;
      case '/latest-numbers':
        return HomeRoutes.latestNumbers;
      case '/prevention':
        return HomeRoutes.prevention;
      case '/symptom-checker':
        return HomeRoutes.symptomChecker;
      default:
        return HomeRoutes.home;
    }
  }
}

/// Mappping the [HomeRoutes] to the particular [MaterialPageRoute] returning the
///  appropriate Screen
class HomeRouter {
  static List<String> routesStack = [];

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    routesStack.add(settings.name);
    switch (HomeRouteDefinitions.fromString(settings.name)) {
      case HomeRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case HomeRoutes.latestNumbers:
        debugPrint('Entering here inside Latest Numbers');
        return MaterialPageRoute(builder: (_) => StatisticsScreen());
      case HomeRoutes.prevention:
        return MaterialPageRoute(builder: (_) => PreventionScreen());
      case HomeRoutes.symptomChecker:
        return MaterialPageRoute(builder: (_) => SymptomCheckerScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}

/// [HomeNavigator] for [HomeScreen] to handle the different routes re-directed from the
/// [HomeScreen].
///
/// Add any new routes that have to be re-directed from the [HomeScreen]
class HomeNavigator extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Convenience static method for extended functionality
  static void pop(BuildContext context) {
    HomeRouter.routesStack.removeLast();
    navigatorKey.currentState.pop();
  }

  @override
  Widget build(BuildContext context) {
    // Handle the BackButton for the sub-navigator
    return WillPopScope(
      onWillPop: () async {
        if (HomeRouter.routesStack.length == 1) {
          return true;
        }
        HomeRouter.routesStack.removeLast();
        navigatorKey.currentState.pop();
        return false;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: HomeRoutes.home.name,
        onGenerateRoute: (settings) => HomeRouter.generateRoute(settings),
      ),
    );
  }
}
