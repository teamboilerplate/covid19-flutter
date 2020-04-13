import 'package:flutter/material.dart' show BuildContext, required;

/// Base class for all OnBoarding Events
abstract class OnBoardingEvent {}

/// Signals that the app has started and is in memory
class AppStarted extends OnBoardingEvent {
  BuildContext context;

  AppStarted({@required this.context});
}

/// Signals that the app has entered Tutorila mode
class TutorialModeBegin extends OnBoardingEvent {}

/// Signals that the app has exited Tutorila mode
class TutorialModeEnd extends OnBoardingEvent {}
