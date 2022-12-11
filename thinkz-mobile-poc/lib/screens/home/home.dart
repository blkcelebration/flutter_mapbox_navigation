// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/screens/home/widgets/header.dart';
import 'package:thinkz/screens/home/widgets/search_options.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/providers/bottom_modal_provider.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';
import 'package:thinkz/shared/services/api/mapbox.dart';
import 'package:thinkz/shared/styles/color_scheme.dart';
import 'package:thinkz/shared/widgets/route_option/shared_route_option_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LatLng userLocation = LatLng(10, 10);
  final List<CameraPosition> pointsList = [
    CameraPosition(target: LatLng(32.164310893268684, 34.92975942283681), zoom: 14),
    CameraPosition(target: LatLng(31.785794061161756, 35.08815246695214), zoom: 14),
  ];

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  onStyleLoadedCallback() async {
    for (CameraPosition point in pointsList) {
      MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
      await mapboxProvider.mapboxGlController?.addSymbol(
        SymbolOptions(
          geometry: point.target,
          iconSize: 0.2,
        ),
      );
    }
  }

  void getUserLocation() async {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    userLocation = LatLng(
      mapboxProvider.locationData?.latitude ?? 0.0,
      mapboxProvider.locationData?.longitude ?? 0.0,
    );
  }

  void onCenterButtonClicked() {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    mapboxProvider.mapboxGlController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: userLocation,
          zoom: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: true);
    Widget routesWidget = Container();

    if (mapboxProvider.routesLoaded) {
      List<Widget> routesButtons = [];
      for (int i = 0; i < mapboxProvider.routesWaypoints.length; i++) {
        if (routesButtons.isNotEmpty) {
          routesButtons.add(SizedBox(height: 10.h));
        }

        int aqlRank = 1;
        if (mapboxProvider.bHasPollutionInfo) {
          aqlRank = mapboxProvider.pollutionRanks?.pollutionGrades?[i] ?? 0;
        }

        routesButtons.add(SharedRouteOptionWidget(
          borderColor: mapboxProvider.pollutionRanks?.colorRanks?[i] ?? Colors.white,
          duration:
              mapboxProvider.directionsResponse?.routes?[i].legs?[0].duration?.text?.replaceAll(" hours", "hr").replaceAll(" minutes", "m") ?? "",
          aqlRank: aqlRank,
          routeIndex: i,
        ));
        routesWidget = Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: routesButtons,
          ),
        );
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          Scaffold(
            floatingActionButton: GestureDetector(
              onTap: onCenterButtonClicked,
              child: CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.red1,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.red1,
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      HomeHeader(),
                      Expanded(
                        child: Container(
                          color: AppColors.red1,
                          child: MapboxMap(
                            attributionButtonPosition: AttributionButtonPosition.BottomRight,
                            attributionButtonMargins: Point(27.w, 26.h),
                            minMaxZoomPreference: MinMaxZoomPreference(7, 17),
                            onStyleLoadedCallback: onStyleLoadedCallback,
                            accessToken: MapboxPaths.PUBLIC_TOKEN,
                            onMapCreated: (controller) => mapboxProvider.mapboxGlController = controller,
                            compassEnabled: true,
                            initialCameraPosition: CameraPosition(
                              target: userLocation,
                              zoom: 14,
                            ),
                            myLocationEnabled: true,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 120.h),
                    child: routesWidget,
                  )
                ],
              ),
            ),
          ),
          SearchOptions(),
        ],
      ),
    );
  }
}
