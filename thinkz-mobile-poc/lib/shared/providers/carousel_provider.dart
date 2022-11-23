import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';

class CarouselProvider extends ChangeNotifier {
  CarouselController carouselController = CarouselController();
  bool animationFromHome = false;

  void onRouteOptionPressedOnHomeScreen({required int routeIndex, required BuildContext context}) async {
    animationFromHome = true;
    await carouselController.animateToPage(routeIndex);
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    await mapboxProvider.updateRouteLinesOpacity();
    animationFromHome = false;
  }

  Future<void> onCarouselOptionChanged({
    required int routeIndex,
    required BuildContext context,
  }) async {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    mapboxProvider.chosenRouteIndex = routeIndex;
    await mapboxProvider.updateRouteLinesOpacity();
  }
}
