import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/providers/bottom_modal_provider.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';

import '../../../styles/styles.dart';

class BottomModalTempStartButton extends StatelessWidget {
  const BottomModalTempStartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    BottomModalProvider bottomModalProvider = Provider.of<BottomModalProvider>(context, listen: true);

    return GestureDetector(
      onTap: () => mapboxProvider.startTurnByTurnNavigation(),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 14),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: SharedStyles.shadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on_sharp,
              color: bottomModalProvider.color,
              size: 25.sp,
            ),
            const SizedBox(width: 4),
            Text(
              "Start",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 24.sp,
                color: bottomModalProvider.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
