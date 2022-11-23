// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/models/google_api/network/get_directions_response.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_ranks.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_site_model.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_sites_model.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';

class PollutionService {
  static const RANGE_AIR_QUALITY_CHECK = 300;

  static PollutionRanks getColorAccordingToRouteRank({
    required GetDirectionsResponse directionsResponseFromGoogleApi,
    required PollutionSitesModel? pollutionsInfo,
    required List<List<WayPoint>> routeWayPoints,
  }) {
    PollutionRanks pollutionRanks = PollutionRanks();
    int numRoutes = directionsResponseFromGoogleApi.routes?.length ?? 0;
    List<List<WayPoint>> routes = List.filled(numRoutes, []);
    List<double> distances = List.filled(numRoutes, 1);
    List<double> durations = List.filled(numRoutes, 1);
    List<PollutionSiteModel>? airQualityPoints = [];
    for (int i = 0; i < numRoutes; i++) {
      var route = directionsResponseFromGoogleApi.routes?[i];
      routes[i] = routeWayPoints[i];
      distances[i] = route?.legs?[0].distance?.value ?? 0;
      durations[i] = route?.legs?[0].duration?.value ?? 0;
    }
    if (pollutionsInfo?.data?.subCategories?.isEmpty == false) {
      airQualityPoints = pollutionsInfo?.data?.subCategories?[0].sites;
    }
    Map<String, List<num>> ranks = PollutionService.calcRoutesPollutionRank(
      airQualityPoints: airQualityPoints,
      distances: distances,
      durations: durations,
      routes: routes,
    );
    List<Color> colorsByRank = List.filled(ranks["ranks"]!.length, Colors.green);
    List<int> indexes = [];

    for (int i = 0; i < ranks["ranks"]!.length; i++) {
      if (ranks["ranks"]![i] <= 1) {
        colorsByRank[i] = Colors.green;
      }
      if (ranks["ranks"]![i] >= 2) {
        colorsByRank[i] = Colors.orange;
      }
      if (ranks["ranks"]![i] >= 3) {
        colorsByRank[i] = Colors.red;
      }
      indexes.add(i);
    }

    pollutionRanks.colorRanks = [...colorsByRank];
    pollutionRanks.pollutionGrades = ranks["grades"] as List<int>;
    pollutionRanks.ranksIndex = indexes;
    return pollutionRanks;
  }

  static List<int> getMinMaxIndex(List<double> ranks) {
    double maxValue = 999;
    double minValue = 999;
    int maxIndex = 999;
    int minIndex = 999;
    int midIndex = 999;

    for (int i = 0; i < ranks.length; i++) {
      if (i == 0) {
        maxValue = ranks[0];
        maxIndex = 0;
      }
      if (ranks[i] > maxValue) {
        minIndex = maxIndex;
        minValue = maxValue;
        maxValue = ranks[i];
        maxIndex = i;
      }
      if (ranks[i] < maxValue) {
        if (ranks[i] < minValue) {
          minIndex = i;
          minValue = ranks[i];
        }
      }
    }
    List<double> minMaxValues = [minValue, maxValue];
    if (ranks.length == 1) {
      return [0];
    }
    if (ranks.length == 2) {
      return [minIndex, maxIndex];
    }
    for (var i = 0; i < ranks.length; i++) {
      if (minMaxValues.contains(ranks[i]) == false) {
        midIndex = i; // fixed from minIndex to midIndex, Eli 30/10/22
      }
    }
    return [minIndex, midIndex, maxIndex];
  }

  static Map<String, List<num>> calcRoutesPollutionRank({
    required List<PollutionSiteModel>? airQualityPoints,
    required List<List<WayPoint>> routes,
    required List<double> distances,
    required List<double> durations,
  }) {
    List<int> airQualityRanks = List.filled(routes.length, 1);
    List<int> airQualityGrades = List.filled(routes.length, 1);
    if (airQualityPoints == null) return {"ranks": [], "grades": []};
    for (var airQualityPoint in airQualityPoints) {
      LatLng currentAq = LatLng(airQualityPoint.latitude ?? 0, airQualityPoint.longitude ?? 0);
      for (int routeIndex = 0; routeIndex < routes.length; routeIndex++) {
        for (var wayPoint in routes[routeIndex]) {
          LatLng convertRoutePoint = LatLng(wayPoint.latitude ?? 0, wayPoint.longitude ?? 0);
          if (RANGE_AIR_QUALITY_CHECK >= getDistance(convertRoutePoint, currentAq)) {
            if (airQualityRanks[routeIndex] < (airQualityPoint.rank ?? 0) && airQualityPoint.rank != 4) {
              airQualityRanks[routeIndex] = airQualityPoint.rank ?? 0;
              airQualityGrades[routeIndex] = airQualityPoint.airQualityGrade ?? 0;
            }
          }
        }
      }
    }
    List<double> finalRanks = [];
    for (var rank in airQualityRanks) {
      finalRanks.add(rank.toDouble());
    }
    return {"ranks": finalRanks, "grades": airQualityGrades};
  }

  static double getDistance(LatLng p1, LatLng p2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((p2.latitude - p1.latitude) * p) / 2 +
        cos(p1.latitude * p) * cos(p2.latitude * p) * (1 - cos((p2.longitude - p1.longitude) * p)) / 2;
    double kmDistance = 12742 * asin(sqrt(a)); // km
    return kmDistance * 1000; // meters
  }

  static List<double> sharonsFormula({
    required List<int> pollutionRanks,
    required List<double> distances, // meters
    required List<double> durations, // minutes
    required int numRoutes,
  }) {
    List<double> newRanks = List.filled(numRoutes, 1);
    for (int i = 0; i < numRoutes; i++) {
      double aRank = pollutionRanks[i].toDouble();
      double bRank = distances[i] / (addUpValues(distances) / numRoutes);
      double cRank = durations[i] / (addUpValues(durations) / numRoutes);
      double finalRank = 0.6 * aRank + 0.2 * bRank + 0.2 * cRank;
      newRanks[i] = finalRank;
    }
    return [...newRanks];
  }

  static double addUpValues(List<double> values) {
    return values.fold(0, (p, c) => p + c);
  }
}
