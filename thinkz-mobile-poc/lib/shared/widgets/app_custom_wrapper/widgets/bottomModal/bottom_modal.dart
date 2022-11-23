import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:thinkz/shared/models/google_api/network/get_directions_response.dart';
import 'package:thinkz/shared/providers/bottom_modal_provider.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';
import 'package:thinkz/shared/models/google_api/route.dart' as DRoute;
import 'routesCarousel/card/bottom_modal_card.dart';
import 'routesCarousel/carousel.dart';
import 'bottom_modal_down_arrow.dart';


class BottomModal extends StatefulWidget {
  const BottomModal({Key? key}) : super(key: key);

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {


  @override
  Widget build(BuildContext context) {
    BottomModalProvider bottomProvider = Provider.of<BottomModalProvider>(context, listen: true);

    return Positioned(
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: bottomProvider.showModal ? 200.h : 0,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: [
            const BottomModalDownArrow(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160.h,
              margin: EdgeInsets.only(top: 30.h),
              child: const Carousel(),
              //child: const BottomModalTempStartButton(),
            ),
          ],
        ),
      ),
    );
  }
}
