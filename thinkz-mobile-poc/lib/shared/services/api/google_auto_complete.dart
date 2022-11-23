
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/models/google_auto_complete/google_auto_complete_model.dart';
import 'package:thinkz/shared/models/google_auto_complete/google_place_model.dart';
import 'package:thinkz/shared/services/api/api.dart';

class GoogleAutocompleteAPI {
  static Future<GoogleAutoCompleteModel> search({required String search}) async {
    final String path = ServerPaths.GOOGLE_AUTOCOMPLETE +
        "input=" + search.replaceAll(" ", "%20") +
        "&key=" + ServerPaths.GOOGLE_API_KEY;
    
    final item = await HttpService.getRequest(path);
    
    GoogleAutoCompleteModel? decoded = GoogleAutoCompleteModel.fromJson(item);
    
    return decoded;
  }

  static Future<GooglePlaceModel> getLocation({required String placeId}) async {
    final String path = ServerPaths.GOOGLE_PLACES + "place_id=${placeId}&key=" + ServerPaths.GOOGLE_API_KEY;
    
    final item = await HttpService.getRequest(path);
    print("place item ${item}");
    GooglePlaceModel? decoded = GooglePlaceModel.fromJson(item);
    
    return decoded;
  }
}
