import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/models/google_api/network/get_directions_response.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_ranks.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_sites_model.dart';
import 'package:thinkz/shared/providers/loading_provider.dart';
import 'package:thinkz/shared/services/api/google_api.dart';
import 'package:thinkz/shared/services/api/mapbox.dart';
import 'package:thinkz/shared/services/api/msbit.dart';
import 'package:thinkz/shared/services/pollution/pollution_service.dart';

import '../models/google_api/step.dart';
import '../models/google_api/step.dart' as models;

class MapboxProvider extends ChangeNotifier {
  String platformVersion = 'Unknown';
  String instruction = "";
  MapBoxNavigation? directions;
  MapBoxOptions? options;
  MapboxMapController? mapboxGlController;
  bool isMultipleStop = false;
  double distanceRemaining = 0.0;
  double durationRemaining = 0.0;
  MapBoxNavigationViewController? controller;
  bool routeBuilt = false;
  bool isNavigating = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;
  List<List<WayPoint>> routesWaypoints = [];
  List<Color>? routeColors;
  BuildContext? context;
  GetDirectionsResponse? directionsResponse;
  PollutionRanks? pollutionRanks;
  int chosenRouteIndex = -1;
  bool routesLoaded = false;
  bool bHasPollutionInfo = false;

  Future<void> initialize({required bool mounted}) async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    directions = MapBoxNavigation(onRouteEvent: onEmbeddedRouteEvent);
    options = MapBoxOptions(
      zoom: 22.0,
      tilt: 0.0,
      bearing: 0.0,
      enableRefresh: false,
      alternatives: true,
      voiceInstructionsEnabled: true,
      bannerInstructionsEnabled: true,
      allowsUTurnAtWayPoints: true,
      mode: MapBoxNavigationMode.walking,
      units: VoiceUnits.imperial,
      simulateRoute: false,
      animateBuildRoute: true,
      longPressDestinationEnabled: true,
      language: "en",
    );

    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await directions?.platformVersion ?? '';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    platformVersion = platformVersion;
    notifyListeners();

    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
  }

  Future<void> onEmbeddedRouteEvent(e) async {
    // distanceRemaining = await directions?.distanceRemaining ?? 0;
    // durationRemaining = await directions?.durationRemaining ?? 0;

    switch (e.eventType) {
      case MapBoxEvent.progress_change:
        var progressEvent = e.data as RouteProgressEvent;
        if (progressEvent.currentStepInstruction != null) {
          instruction = progressEvent.currentStepInstruction ?? "";
        }
        break;
      case MapBoxEvent.route_building:
      case MapBoxEvent.route_built:
        routeBuilt = true;
        notifyListeners();
        break;
      case MapBoxEvent.route_build_failed:
        routeBuilt = false;
        notifyListeners();
        break;
      case MapBoxEvent.navigation_running:
        isNavigating = true;
        notifyListeners();
        break;
      case MapBoxEvent.on_arrival:
        if (!isMultipleStop) {
          await Future.delayed(Duration(seconds: 3));
          await controller?.finishNavigation();
        } else {}
        break;
      case MapBoxEvent.navigation_finished:
      case MapBoxEvent.navigation_cancelled:
        routeBuilt = false;
        isNavigating = false;
        notifyListeners();
        break;
      default:
        break;
    }
    notifyListeners();
  }

  // buildSingleRoute(BuildContext context, List<double> origin, List<double> destination) async {
  //   LoadingProvider loadingProvider = Provider.of<LoadingProvider>(context, listen: false);
  //   loadingProvider.setIsLoading(true);
  //   setRoutesLoaded(false);
  //   this.context = context;
  //   loadingProvider.setIsLoading(false);
  //   removeRoutes();

  //   Map geometry = await MapboxApi.getSingleRouteFromMapbox(origin, destination);
  //   List coordinates = geometry["coordinates"];
  //   LatLng startPosition = LatLng(coordinates[0][1], coordinates[0][0]);
  //   LatLng destPosition = LatLng(coordinates[coordinates.length - 1][1], coordinates[coordinates.length - 1][0]);
  //   print("adam${coordinates}");
  //   print("adam${startPosition}");
  //   print("adam${destPosition}");
  //   await getRouteColors(startPosition, destPosition);
  //   await addRouteLineOnMap(0, true, [], geometry);

  //   await addSymbol("1", startPosition, "assets/images/location_new.png");
  //   await addSymbol("2", destPosition, "assets/images/flag_new.png");
  //   mapboxGlController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: startPosition, zoom: 14)));
  //   setRoutesLoaded(true);
  //   notifyListeners();
  // }

  buildRoutes(BuildContext context, String origin, String destination) async {
    LoadingProvider loadingProvider = Provider.of<LoadingProvider>(context, listen: false);
    loadingProvider.setIsLoading(true);
    setRoutesLoaded(false);
    this.context = context;
    routesWaypoints = [];
    directionsResponse = await GoogleApi.getDirections(origin, destination);
    directionsResponse?.routes?.forEach((element) {
      if ((element.legs?.length ?? 0) > 0) {
        List<WayPoint> wayPoints = getWayPointsFromSteps(element.legs![0].steps ?? []);
        // print("yarden is amazing ${wayPoints}");
        // List<WayPoint> wayPoints =
        //     getWayPoints(element.overviewPolyline?.points);
        routesWaypoints.add(wayPoints);
      }
    });

    await loadRoutes(0, false);
    loadingProvider.setIsLoading(false);
    notifyListeners();
  }

  loadRoutes(int index, bool removeLayer) async {
    removeRoutes();
    if (routesWaypoints.isEmpty || routesWaypoints[0].isEmpty) {
      print("No routes!!!!!!!!");
      return;
    }

    LatLng startPosition = LatLng(routesWaypoints[0].first.latitude ?? 0, routesWaypoints[0].first.longitude ?? 0);
    LatLng destPosition = LatLng(routesWaypoints[0].last.latitude ?? 0, routesWaypoints[0].last.longitude ?? 0);

    mapboxGlController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: startPosition, zoom: 14)));

    await getRouteColors(startPosition, destPosition);

    try {
      for (int i = 0; i < routesWaypoints.length; i++) {
        await addRouteLineOnMap(routesWaypoints[i], i, removeLayer);
      }

      // await mapboxGlController?.clearSymbols();

      await addSymbol("1", startPosition, "assets/images/location_new.png");
      await addSymbol("2", destPosition, "assets/images/flag_new.png");
    } catch (e) {
      print(e);
    }

    setRoutesLoaded(true);
  }

  addSymbol(String id, LatLng position, final String imagePath) async {
    await mapboxGlController?.addSymbolLayer(
      "position$id",
      "layer$id",
      SymbolLayerProperties(
        iconImage: imagePath,
        iconSize: 3,
        iconAllowOverlap: true,
      ),
    );

    Map<String, dynamic> featureCollection = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "geometry": {
            "type": "Point",
            "coordinates": [position.longitude, position.latitude]
          }
        }
      ]
    };

    // await mapboxGlController?.removeLayer("layer$id");
    // await mapboxGlController?.removeSource("position$id");

    await mapboxGlController?.addGeoJsonSource("position$id", featureCollection);
  }

  setRoutesLoaded(bool loaded) {
    routesLoaded = loaded;
    notifyListeners();
  }

  addRouteLineOnMap(List<WayPoint> wayPoints, int i, bool removeLayer) async {
    print("adam is amazing");
    Map geometry = await MapboxApi.getRouteFromMapbox(routesWaypoints[i]);
    print("geometry $i ${geometry.toString()}");
    final fills = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "id": 0,
          "properties": <String, dynamic>{},
          "geometry": geometry,
        },
      ],
    };

    // Remove lineLayer and source if it exists
    if (removeLayer == true) {
      await mapboxGlController?.removeLayer("lines$i");
      await mapboxGlController?.removeSource("fills$i");
    }
    print("current color ${pollutionRanks?.colorRanks?[i].value.toRadixString(16)}");
    // Add new source and lineLayer
    await mapboxGlController?.addSource("fills$i", GeojsonSourceProperties(data: fills));
    await mapboxGlController?.addLineLayer(
      "fills$i",
      "lines$i",
      LineLayerProperties(
        lineColor: pollutionRanks?.colorRanks?[i].toHexStringRGB(),
        lineCap: "round",
        lineJoin: "round",
        lineWidth: 5,
      ),
    );
  }

  Future<void> updateRouteLinesOpacity() async {
    for (int i = 0; i < routesWaypoints.length; i++) {
      await mapboxGlController?.removeLayer("lines$i");
      await mapboxGlController?.addLineLayer(
        "fills$i",
        "lines$i",
        LineLayerProperties(
            lineColor: pollutionRanks?.colorRanks?[i].toHexStringRGB(),
            lineCap: "round",
            lineJoin: "round",
            lineWidth: 5,
            lineOpacity: chosenRouteIndex == i ? 1 : 0.6),
        belowLayerId: "lines$chosenRouteIndex",
      );
    }
  }

  Future<void> removeRoutes() async {
    setRoutesLoaded(false);

    for (int i = 0; i < routesWaypoints.length; i++) {
      await mapboxGlController?.removeLayer("lines$i");
      await mapboxGlController?.removeSource("fills$i");
    }

    //remove start/destination symbols
    mapboxGlController?.removeSource("position1");
    mapboxGlController?.removeLayer("layer1");
    mapboxGlController?.removeSource("position2");
    mapboxGlController?.removeLayer("layer2");
  }

  Future<void> getRouteColors(LatLng startPosition, LatLng destinationPosititon) async {
    //  GetDirectionsResponse directionsResponseFromGoogleApi =
    //      await GoogleApi.getDirections("tel aviv", "ashdod");
    PollutionSitesModel? pollutionPoints = await MSBitServerApi.getPoulltionPoints(
      currentLat: locationData?.latitude ?? 0,
      currentLong: locationData?.longitude ?? 0,
      startLat: startPosition.latitude,
      startLong: startPosition.longitude,
      destinationLat: destinationPosititon.latitude,
      destinationLong: destinationPosititon.longitude,
    );

    // look for pollution data
    bHasPollutionInfo = false;
    pollutionPoints?.data?.subCategories?.forEach((element) {
      if (element.sites?.isNotEmpty ?? false) {
        bHasPollutionInfo = true;
      }
    });
    // ----------------------

    if (context != null && directionsResponse != null) {
      pollutionRanks = PollutionService.getColorAccordingToRouteRank(
        routeWayPoints: routesWaypoints,
        directionsResponseFromGoogleApi: directionsResponse!,
        pollutionsInfo: pollutionPoints,
      );
    }
  }

  Future<void> startTurnByTurnNavigation() async {
    await directions?.startNavigation(
      wayPoints: getChosenWaypoints(),
      options: MapBoxOptions(
        zoom: 22,
        mode: MapBoxNavigationMode.walking,
        simulateRoute: false,
        language: "en",
        units: VoiceUnits.metric,
      ),
    );
  }

  Future<void> showRoutes() async {
    await directions?.startNavigation(
      wayPoints: routesWaypoints[0],
      options: MapBoxOptions(
        zoom: 22,
        mode: MapBoxNavigationMode.walking,
        simulateRoute: false,
        language: "en",
        units: VoiceUnits.metric,
      ),
    );
  }

  List<WayPoint> getWayPointsFromSteps(List<models.Step> steps) {
    int pointsInterval;
    if (steps.length <= Constants.MAX_NUM_WAYPOINTS_FROM_STEPS) {
      pointsInterval = 0;
    } else {
      pointsInterval = (steps.length - 2) ~/ (Constants.MAX_NUM_WAYPOINTS_FROM_STEPS - 2);
    }

    List<WayPoint> wayPoints = [];
    wayPoints.add(WayPoint(name: "", latitude: steps.first.startLocation?.lat, longitude: steps.first.startLocation?.lng)); // first

    // loop in all besides first and last
    for (int i = 1; i < steps.length - 1; i++) {
      if (pointsInterval == 0 || i % pointsInterval == 0) {
        // prevent inserting more waypoints than max ( -1 is because the last one inserted after this loop
        if (wayPoints.length < (Constants.MAX_NUM_WAYPOINTS_FROM_STEPS - 1)) {
          wayPoints.add(WayPoint(name: "", latitude: steps[i].startLocation?.lat, longitude: steps[i].startLocation?.lng));
        }
      }
    }

    wayPoints.add(WayPoint(name: "", latitude: steps.last.endLocation?.lat, longitude: steps.last.endLocation?.lng)); // first

    return wayPoints;
  }

  List<WayPoint> getWayPoints(String encodedPolyline) {
    List<WayPoint> poly = [];
    List<WayPoint> wayPoints = [];
    try {
      int index = 0, len = encodedPolyline.length;
      int lat = 0, lng = 0;

      while (index < len) {
        int b, shift = 0, result = 0;
        do {
          b = encodedPolyline.codeUnitAt(index++) - 63;
          result |= (b & 0x1f) << shift;
          shift += 5;
        } while (b >= 0x20);
        int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
        lat += dlat;

        shift = 0;
        result = 0;
        do {
          b = encodedPolyline.codeUnitAt(index++) - 63;
          result |= (b & 0x1f) << shift;
          shift += 5;
        } while (b >= 0x20);
        int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
        lng += dlng;
        WayPoint p = WayPoint(name: "", latitude: (lat / 1E5).toDouble(), longitude: (lng / 1E5).toDouble());

        poly.add(p);
      }

      int pointsInterval = poly.length ~/ Constants.MAX_NUM_WAYPOINTS;
      wayPoints.add(poly[0]);

      for (int i = 1; i < (poly.length - 1); i++) {
        if (pointsInterval == 0 || i % pointsInterval == 0) {
          wayPoints.add(poly[i]);
        }
        if (wayPoints.length == Constants.MAX_NUM_WAYPOINTS) {
          break;
        }
      }
      wayPoints.add(poly[poly.length - 1]);
    } catch (e) {
      print(e);
    }
    return wayPoints;
  }

  List<WayPoint> getChosenWaypoints() {
    return routesWaypoints[chosenRouteIndex];
  }

  String getRouteColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue.toHexStringRGB();
      case 1:
        return Colors.green.toHexStringRGB();
      case 2:
        return Colors.pink.toHexStringRGB();
    }
    return Colors.blue.toHexStringRGB();
  }
}
