import 'package:dio/dio.dart';
import 'package:thinkz/shared/consts/paths.dart';

import '../../models/google_api/network/get_directions_response.dart';

class GoogleApi {
  static Future<GetDirectionsResponse> getDirections(
      String origin, String destination) async {
    GetDirectionsResponse result = GetDirectionsResponse();
    try {
      String url = ServerPaths.getDirectionsUrl(
          origin: origin, destination: destination);
      print("google url " + url);
      final response = await Dio().get(url);
      result = GetDirectionsResponse.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
    }
    return result;
  }
}
