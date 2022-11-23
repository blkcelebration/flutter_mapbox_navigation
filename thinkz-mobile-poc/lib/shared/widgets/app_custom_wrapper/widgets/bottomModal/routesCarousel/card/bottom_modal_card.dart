import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/models/google_api/network/get_directions_response.dart';
import 'package:thinkz/shared/models/google_api/route.dart' as DRoute;

import '../../../../../../providers/mapbox_provider.dart';
import '../../../../../../styles/color_scheme.dart';
import '../../../../../../styles/styles.dart';
import 'carouse_nav_item.dart';
import 'navigate_button.dart';
import 'remove_button.dart';

class BottomModalCard extends StatelessWidget {
  final int index;
  final DRoute.Route route;
  final Color color;
  const BottomModalCard({Key? key, required this.index, required this.route, required this.color}) : super(key: key);
    
   List<CarouselNavItem> carouselNavItems(GetDirectionsResponse? googleRoutesData){
    List<CarouselNavItem> navItems= [];
    int routesLength = googleRoutesData?.routes?.length ?? 0;
    for (int i = 0; i < routesLength; i++) {
      navItems.add(CarouselNavItem(active: index == i ? true : false));
    }
    return navItems;
  }

  String timeFormat(double seconds){
    var h = ((seconds % (3600 * 24)) / 3600).floor();
    var m = ((seconds % 3600) / 60).round();
    return "${h} Hours ${m} Minutes";
  }

  String distanceFormat(String text){
    return text.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: true);
    return Container(
      width: 400.w,
      margin: const EdgeInsets.only(left: 12, right: 12, top: 4),
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: SharedStyles.shadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60.h,
                width: 4.w,
                decoration: BoxDecoration(
                  color: color, 
                  borderRadius: BorderRadius.circular(25)
                ),
              ),
              SizedBox(
                width: 110.w,
                child: Text(
                  timeFormat(route.legs?[0].duration?.value ?? 0.0),
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: const Color(0xff262626),
                    fontSize: 17.sp,
                    fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: const Icon(
                  Icons.circle_rounded,
                  size: 6,
                  color: AppColors.red1
                ),
              ),
              Text(
                distanceFormat(route.legs?[0].distance?.text ?? ''),
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: const Color(0xff262626),
                  fontSize: 17.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                height: 60.h,
                alignment: Alignment.topCenter,
                child: const RemoveButton(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: NavigateButton()
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselNavItems(mapboxProvider.directionsResponse),
            ),
        ],
      ),
    );
  }
}
