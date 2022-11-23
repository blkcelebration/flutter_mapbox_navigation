import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/models/google_api/network/get_directions_response.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_site_model.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_sites_model.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';
import 'package:thinkz/shared/services/api/google_api.dart';
import 'package:thinkz/shared/services/api/msbit.dart';
import 'package:thinkz/shared/services/pollution/pollution_service.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  void testRoute() async {
    GetDirectionsResponse directionsResponseFromGoogleApi =
        await GoogleApi.getDirections("tel aviv", "ashdod");
    PollutionSitesModel? sharonResponse =
        await MSBitServerApi.getPoulltionPoints(
      currentLat: 32.109333,
      currentLong: 34.855499,
      startLat: 32.109333,
      startLong: 34.855499,
      destinationLat: 31.801447,
      destinationLong: 34.643497,
    );
    List<Color> colorsByRank = [];
    /*
    List<Color> colorsByRank = PollutionService.getColorAccordingToRouteRank(
      directionsResponseFromGoogleApi: directionsResponseFromGoogleApi,
      pollutionsInfo: sharonResponse,
      routeWayPoints:
    );

     */

    print(colorsByRank);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Starting Template"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: testRoute, child: Text("eli is amazing!"))
        ],
      ),
    );
  }
}
