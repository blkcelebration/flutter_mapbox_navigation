// ignore_for_file: constant_identifier_names

class ClientPaths {
  static const TEST = '/test';
  static const HOME = '/HOME';
  static const NAVIGATION = '/NAVIGATION';
  static const SPLASH = '/SPLASH';
  static const MENU = '/MENU';
  static const HELP_POPUP = '/HELP_POPUP';
}

class ServerPaths {
  // google api
  static const GOOGLE_DIRECTIONS_STEPS =
      "https://maps.googleapis.com/maps/api/directions/"; //json?origin=Brooklyn&destination=Queens&mode=walking&alternatives=true&key=AIzaSyAGQ7hdhDOiHslIJ59MBVM-wBOz2DfKQe8";
  static const GOOGLE_API_KEY = "AIzaSyAGQ7hdhDOiHslIJ59MBVM-wBOz2DfKQe8";
  //static const GOOGLE_AUTOCOMPLETE = "https://maps.googleapis.com/maps/api/place/autocomplete/json?";
  static const GOOGLE_AUTOCOMPLETE = "https://maps.googleapis.com/maps/api/place/queryautocomplete/json?";
  static const GOOGLE_PLACES = "https://maps.googleapis.com/maps/api/place/details/json?";


  static const DEV = "https://thinkz-api-dev.msbit.co.il/";
  static const PROD = "https://api.thinkz.info/";

  static getDirectionsUrl({String origin = "", String destination = "", String mode = "walking"}) {
    return "${GOOGLE_DIRECTIONS_STEPS}json?origin=$origin&destination=$destination&mode=$mode&alternatives=true&key=$GOOGLE_API_KEY";
  }

  static const TEST = "https://jsonplaceholder.typicode.com/posts/2";
}

class MapboxPaths {
  static const PUBLIC_TOKEN = "pk.eyJ1IjoidGhpbmt6YWkiLCJhIjoiY2w3NG5pMzhvMDZzNDN2cDRzZHFiaHZlZyJ9.DPFIl0lKqwU-mlVRWIlhrA";
  static const SECRET_TOKEN = "sk.eyJ1IjoidGhpbmt6YWkiLCJhIjoiY2w5d2p0ajVlMDFpazN1cXJ4eGk4cjJ1YiJ9.vKcbcFzOx8l2gZDO_cb2Lg";
  static const SEARCH = "https://api.mapbox.com/geocoding/v5/mapbox.places/";
  static const WALKING_DIRECTIONS = "https://api.mapbox.com/directions/v5/mapbox/walking/";

  static getRouteByWaypoints(String wayPointsStr){
    return "${WALKING_DIRECTIONS}${wayPointsStr}?alternatives=false&annotations=distance%2Cduration%2Cspeed%2Ccongestion"
        "&geometries=geojson&language=en&overview=full&steps=true&exclude=ferry&walkway_bias=1&access_token=${MapboxPaths.PUBLIC_TOKEN}";
  }
  static getRouteByCoordinates(List<double> origin, List<double> destination){
    return "${WALKING_DIRECTIONS}${origin[0]},${origin[1]};${destination[0]},${destination[1]}?"
        "alternatives=true&annotations=distance%2Cduration%2Cspeed%2Ccongestion"
        "&geometries=geojson&language=en&overview=full&steps=true&exclude=ferry&walkway_bias=1&access_token=${MapboxPaths.PUBLIC_TOKEN}";
  }
}

class ThinkzConstants {
  static const CONTACTS_EMAIL = "info@thinkz.ai";
  static const SITE_ADDRESS = "https://thinkz.ai/";
}

class Constants {
  static const MAX_NUM_WAYPOINTS_FROM_STEPS = 25;
  static const MAX_NUM_WAYPOINTS = 23;
}
