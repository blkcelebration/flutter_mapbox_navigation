import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/models/google_api/route.dart' as DRoute;
import 'package:thinkz/shared/providers/carousel_provider.dart';

import '../../../../../models/google_api/network/get_directions_response.dart';
import '../../../../../providers/mapbox_provider.dart';
import 'card/bottom_modal_card.dart';

class Carousel extends StatelessWidget {
  
  const Carousel({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: true);
    CarouselProvider carouselProvider = Provider.of<CarouselProvider>(context, listen: true);
    mapboxProvider.pollutionRanks?.colorRanks;

    List<BottomModalCard> routeOptions = [];
    List<BottomModalCard> populateRouteOptions(GetDirectionsResponse? googleRoutesData, List<Color>? colors) {
      routeOptions = [];
      int routesLength = googleRoutesData?.routes?.length ?? 0;
      for (int i = 0; i < routesLength; i++) {
        DRoute.Route route = googleRoutesData!.routes![i];
        routeOptions.add(BottomModalCard(index: i, route: route, color: colors?[i] ?? Colors.white));
      }

      return [...routeOptions];
    }

    int getRoutesCount(){
      var count = mapboxProvider.directionsResponse?.routes?.length ?? 0;
      return count;
    }

    DRoute.Route? getRouteByIndex(int index){
      DRoute.Route? route = mapboxProvider.directionsResponse?.routes?[index];
      return route;
    }

    Color getRouteColorByIndex(int index){
     Color color = mapboxProvider.pollutionRanks?.colorRanks?[index] ?? Colors.white;
     return color;
    }
    
    return CarouselSlider.builder(
      carouselController: carouselProvider.carouselController,
      options: CarouselOptions(
        viewportFraction: 0.85,
        onPageChanged: (index, reason) {
          if(carouselProvider.animationFromHome) return;
           carouselProvider.onCarouselOptionChanged(routeIndex: index, context: context);
        },
      ),
      itemCount: getRoutesCount(),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          BottomModalCard(
            index: itemIndex,
            route: getRouteByIndex(itemIndex) ?? DRoute.Route(),
            color: getRouteColorByIndex(itemIndex)
          ),
    );
  }
}