import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/models/search_auto_complete/search_auto_complete_model.dart';
import 'package:thinkz/shared/services/api/api.dart';

class SearchAutoCompleteAPI {
  static Future<SearchAutoCompleteModel?> search(
      {required String search, required LatLng userLocation}) async {
    String proximityCord =
        'proximity=${userLocation.longitude},${userLocation.latitude}&';
    final String path = MapboxPaths.SEARCH +
        search.replaceAll(" ", "%20") +
        ".json?${proximityCord}language=en&access_token=${MapboxPaths.PUBLIC_TOKEN}";
    print("search $path");
    final item = await HttpService.getRequest(path);
    SearchAutoCompleteModel? decoded = SearchAutoCompleteModel.fromJson(item);
    return decoded;
  }
}
