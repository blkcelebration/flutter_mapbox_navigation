import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/models/pollution_sites/pollution_sites_model.dart';
import 'package:thinkz/shared/services/api/api.dart';

class MSBitServerApi {
  static Future<PollutionSitesModel?> getPoulltionPoints({
    required double currentLat,
    required double currentLong,
    required double startLat,
    required double startLong,
    required double destinationLat,
    required double destinationLong,
  }) async {
    String path = ServerPaths.PROD +
        "Site?Range=1000&SubCategoryIds=1&Current.Latitude=$currentLat&Current.Longitude=$currentLong&Origin.Latitude=$startLat&Origin.Longitude=$startLong&Destination.Latitude=$destinationLong&Destination.Longitude=$destinationLong";
    final item = await HttpService.getRequest(path);
    PollutionSitesModel decoded = PollutionSitesModel.fromJson(item);
    // print("haha ${decoded.data?.subCategories?[0].sites?[0].latitude}");
    return decoded;
  }
}
