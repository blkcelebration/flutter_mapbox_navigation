import 'package:thinkz/screens/help_popup/help_popup.dart';
import 'package:thinkz/screens/home/home.dart';
import 'package:thinkz/screens/menu/menu.dart';
import 'package:thinkz/screens/navigation/navigation_screen.dart';
import 'package:thinkz/screens/splash/splash.dart';
import 'package:thinkz/screens/test/test.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/routes/transitions.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == ClientPaths.TEST) {
      return buildPageTranisition(routePath: settings, newScreen: const TestScreen(), pageTransitions: PageTransitionType.fade);
    }
    if (settings.name == ClientPaths.HOME) {
      return buildPageTranisition(routePath: settings, newScreen: const HomeScreen(), pageTransitions: PageTransitionType.fade);
    }
    if (settings.name == ClientPaths.NAVIGATION) {
      return buildPageTranisition(routePath: settings, newScreen: const NavigationScreen(), pageTransitions: PageTransitionType.fade);
    }
    if (settings.name == ClientPaths.SPLASH) {
      return buildPageTranisition(routePath: settings, newScreen: const Splash(), pageTransitions: PageTransitionType.fade);
    }
    if (settings.name == ClientPaths.MENU) {
      return buildPageTranisition(routePath: settings, newScreen: const MenuScreen(), pageTransitions: PageTransitionType.leftToRight);
    }
    if (settings.name == ClientPaths.HELP_POPUP) {
      return buildPageTranisition(routePath: settings, newScreen: const HelpPopupScreen(), pageTransitions: PageTransitionType.bottomToTop);
    }
    return buildPageTranisition(routePath: settings, newScreen: const TestScreen(), pageTransitions: PageTransitionType.fade);
  }
}
