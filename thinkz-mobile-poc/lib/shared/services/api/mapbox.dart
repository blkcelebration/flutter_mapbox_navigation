import 'dart:convert';

import 'package:flutter_mapbox_navigation/library.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/services/api/api.dart';

class MapboxApi {
  // static Future getRouteFromMapbox() async {
  //   String path =
  //       "https://api.mapbox.com/directions/v5/mapbox/driving/34.92975942283681%2C32.164310893268684%3B35.08815246695214%2C31.785794061161756?alternatives=true&annotations=distance%2Cduration%2Cspeed%2Ccongestion&geometries=geojson&language=en&overview=full&steps=true&access_token=pk.eyJ1IjoidGhpbmt6IiwiYSI6ImNsNTlhdTgzdzB4N3MzY25yeW50YzJqamQifQ.-QWIrR8LZQNXauraCRULJQ";
  //   final response = await HttpService.getRequest(path);
  //   Map geometry = response['routes'][0]['geometry'];
  //   num duration = response['routes'][0]['duration'];
  //   num distance = response['routes'][0]['distance'];
  //   print(geometry);
  //   return response;
  // }
  static Future<Map> getRouteFromMapbox(List<WayPoint> wayPoints) async {
    String wayPointsStr = "";
    wayPoints.forEach((element) {
      if (wayPointsStr.isNotEmpty) wayPointsStr += "%3B";
      wayPointsStr += "${element.longitude}%2C${element.latitude}";
    });

    String path = MapboxPaths.getRouteByWaypoints(wayPointsStr);
    final response = await HttpService.getRequest(path);
    
    Map geometry = response['routes'][0]['geometry'];
    //num duration = response['routes'][0]['duration'];
    //num distance = response['routes'][0]['distance'];
    return geometry;
  }

  static Future<Map> getRouteFromMapboxTwo() async {
    String path =
        //  "https://api.mapbox.com/directions/v5/mapbox/walking/34.92975942283681%2C32.164310893268684%3B34.63547583720734%2C30.79336359076528?alternatives=true&annotations=distance%2Cduration%2Cspeed%2Ccongestion&geometries=geojson&language=en&overview=full&steps=true&access_token=pk.eyJ1IjoidGhpbmt6IiwiYSI6ImNsNTlhdTgzdzB4N3MzY25yeW50YzJqamQifQ.-QWIrR8LZQNXauraCRULJQ";
        "https://api.mapbox.com/directions/v5/mapbox/walking/34.8114393%2C31.8925572%3B34.8121116%2C31.8929166%3B34.8020481%2C31.9586981%3B34.7983539%2C31.9712181%3B34.7917428%2C31.9724646?alternatives=true&annotations=distance%2Cduration%2Cspeed%2Ccongestion&geometries=geojson&language=en&overview=full&steps=true&access_token=pk.eyJ1IjoidGhpbmt6YWkiLCJhIjoiY2w3NG5pMzhvMDZzNDN2cDRzZHFiaHZlZyJ9.DPFIl0lKqwU-mlVRWIlhrA";
    final response = await HttpService.getRequest(path);
    Map geometry = response['routes'][0]['geometry'];
    // num duration = response['routes'][0]['duration'];
    // num distance = response['routes'][0]['distance'];
    return geometry;
  }

  static Future<Map> getSingleRouteFromMapbox(List<double> origin, List<double> destination) async {
    String path = MapboxPaths.getRouteByCoordinates(origin, destination);
    final response = await HttpService.getRequest(path);
    Map geometry = response['routes'][0]['geometry'];
    // num duration = response['routes'][0]['duration'];
    // num distance = response['routes'][0]['distance'];
    return geometry;
  }
}
