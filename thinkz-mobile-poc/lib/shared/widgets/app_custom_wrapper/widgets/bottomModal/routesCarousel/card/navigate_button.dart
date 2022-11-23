import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/providers/bottom_modal_provider.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';

import '../../../../../../styles/color_scheme.dart';
import '../../../../../../styles/styles.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    BottomModalProvider bottomModalProvider = Provider.of<BottomModalProvider>(context, listen: true);

    return GestureDetector(
      onTap: () => mapboxProvider.startTurnByTurnNavigation(),
      child: Container(
        width: 45.w,
        height: 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: AppColors.red1,
          boxShadow: SharedStyles.shadow,
        ),
        child: Image.asset("assets/images/thinkz-dots.png", height: 20)
      ),
    );
  }
}
