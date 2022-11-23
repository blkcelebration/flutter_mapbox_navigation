import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/providers/bottom_modal_provider.dart';
import 'package:thinkz/shared/providers/carousel_provider.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';

class SharedRouteOptionWidget extends StatelessWidget {
  final Color borderColor;
  final int aqlRank;
  final String duration;
  final String hours;
  final String minutes;
  final int routeIndex;
  const SharedRouteOptionWidget(
      {Key? key,
      this.borderColor = Colors.green,
      this.aqlRank = 1,
      this.hours = "8",
      this.minutes = "27",
      this.duration = "8hr 27m",
      this.routeIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressed() async {
      MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
      BottomModalProvider bottomModalProvider = Provider.of<BottomModalProvider>(context, listen: false);
      CarouselProvider carouselProvider = Provider.of<CarouselProvider>(context, listen: false);
      mapboxProvider.chosenRouteIndex = routeIndex;
      bottomModalProvider.setShowModal(showModal: true, color: borderColor);
      // await mapboxProvider.updateRouteLinesOpacity();
      carouselProvider.onRouteOptionPressedOnHomeScreen(routeIndex: routeIndex, context: context);
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 100),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "AQl $aqlRank",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: "roborto",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                " | $duration",
                //    " | ${hours}hr ${minutes}m",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: "roboto",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
