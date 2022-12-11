// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thinkz/shared/widgets/app_custom_wrapper/app_custom_wrapper.dart';

PageTransition buildPageTranisition({
  required RouteSettings routePath,
  required Widget newScreen,
  required PageTransitionType pageTransitions,
  Widget? currentScreen,
  Alignment? alignment,
  Curve curve = Curves.easeInOut,
  Duration duration = const Duration(milliseconds: 400),
  Duration reverseDuration = const Duration(milliseconds: 300),
}) {
  return PageTransition(
    curve: curve,
    duration: duration,
    type: pageTransitions,
    child: AppCustomWrapper(child: newScreen),
    childCurrent: currentScreen,
    settings: routePath,
    reverseDuration: reverseDuration,
    alignment: alignment,
  );
}
