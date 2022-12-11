import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/screens/home/widgets/search_option_item.dart';
import 'package:thinkz/shared/consts/paths.dart';

import 'package:thinkz/shared/models/google_api/network/get_directions_response.dart';
import 'package:thinkz/shared/models/google_auto_complete/auto_complete_predictions_model.dart';
import 'package:thinkz/shared/models/google_auto_complete/google_auto_complete_model.dart';
import 'package:thinkz/shared/models/google_auto_complete/google_place_model.dart';
import 'package:thinkz/shared/models/google_auto_complete/place_result_model.dart';
import 'package:thinkz/shared/models/search_auto_complete/search_auto_complete_model.dart';
import 'package:thinkz/shared/models/search_auto_complete/search_auto_feature_model.dart';

import 'package:thinkz/shared/providers/bottom_modal_provider.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';
import 'package:thinkz/shared/services/api/google_api.dart';
import 'package:thinkz/shared/services/api/msbit.dart';
import 'package:thinkz/shared/services/api/search_auto_complete.dart';

import '../services/api/google_auto_complete.dart';

class SearchProvider extends ChangeNotifier {
  bool showSearchOptionsInputOne = false;
  bool showSearchOptionsInputTwo = false;
  bool isLoading = false;
  List<SearchOptionItem> searchOptions = [];
  SearchAutoCompleteModel? searchAutoCompleteResponse;
  GoogleAutoCompleteModel? googleAutoCompleteResponse;
  TextEditingController firstInputController = TextEditingController(text: "");
  TextEditingController secondInputController = TextEditingController(text: "");
  int currentInputIndex = -1;
  //SearchAutoCompleteFeatureModel? firstLocationInfo;
  //SearchAutoCompleteFeatureModel? secondLocationInfo;
  GooglePlaceModel? firstLocation;
  GooglePlaceModel? secondLocation;
  GetDirectionsResponse? directionsResponseFromGoogleApi;
  LocationData? userLocationData;

  void autoFillFirstInputToUserLocation() {
    firstInputController.text = "${userLocationData?.longitude}, ${userLocationData?.altitude}";
  }

  void onUserInput({required int inputIndex, required String search, required BuildContext context}) async {
    LatLng userCoordinates = LatLng(userLocationData?.latitude ?? 0, userLocationData?.longitude ?? 0);
    currentInputIndex = inputIndex;
    searchOptions = [];
    isLoading = true;
    //searchAutoCompleteResponse = await SearchAutoCompleteAPI.search(search: search, userLocation: userCoordinates);
    googleAutoCompleteResponse = await GoogleAutocompleteAPI.search(search: search);

    populateSearchOption();
    showSearchOptionsInputOne = inputIndex == 0 && searchOptions.isNotEmpty;
    showSearchOptionsInputTwo = inputIndex == 1 && searchOptions.isNotEmpty;
    isLoading = false;
    if (search.isEmpty) {
      onCloseIconPressed(inputIndex, context);
    }
    notifyListeners();
  }

  void populateSearchOption() {
    List<AutoCompletePredictionsModel> options = googleAutoCompleteResponse?.predictions ?? [];
    for (var option in options) {
      if (searchOptions.length >= 8) return;
      searchOptions.add(SearchOptionItem(
        name: option.description ?? '',
        placeId: option.place_id ?? '',
      ));
    }
  }

  //void onLocationChosen({required SearchAutoCompleteFeatureModel? locationChosenInfo, required BuildContext context}) async {
  void onLocationChosen({required String address, required String placeId, required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    mapboxProvider.setRoutesLoaded(false);
    if (currentInputIndex == 0) {
      firstLocation = await GoogleAutocompleteAPI.getLocation(placeId: placeId);
      firstInputController.text = address;
      showSearchOptionsInputOne = false;
      firstInputController.selection = TextSelection.fromPosition(TextPosition(offset: firstInputController.text.length));
      notifyListeners();
    }
    if (currentInputIndex == 1) {
      secondLocation = await GoogleAutocompleteAPI.getLocation(placeId: placeId);
      secondInputController.text = address;
      showSearchOptionsInputTwo = false;
      secondInputController.selection = TextSelection.fromPosition(TextPosition(offset: secondInputController.text.length));
      notifyListeners();
    }

    if (secondLocation != null) {
      List<double> origin = [userLocationData?.latitude ?? 0.0, userLocationData?.longitude ?? 0.0];
      List<double> destination = [];

      if (firstLocation != null) {
        origin = [
          firstLocation?.result?.geometry?.location?.lat ?? 0,
          firstLocation?.result?.geometry?.location?.lng ?? 0,
        ];
      }
      if (secondLocation != null) {
        destination = [
          secondLocation?.result?.geometry?.location?.lat ?? 0,
          secondLocation?.result?.geometry?.location?.lng ?? 0,
        ];
      }
      mapboxProvider.buildRoutes(
        context,
        "${origin[0]},${origin[1]}",
        "${destination[0]},${destination[1]}",
      );
    }
    notifyListeners();
  }

  void onCloseIconPressed(int inputIndex, BuildContext context) {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    BottomModalProvider bottomModalProvider = Provider.of<BottomModalProvider>(context, listen: false);
    if (inputIndex == 0) {
      firstInputController.clear();
      showSearchOptionsInputOne = false;
      firstLocation = null;
    } else {
      secondInputController.clear();
      showSearchOptionsInputTwo = false;
      secondLocation = null;
    }
    mapboxProvider.removeRoutes();
    bottomModalProvider.setShowModal(showModal: false);

    notifyListeners();
  }
}
