import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/screens/home/widgets/home_input.dart';
import 'package:thinkz/screens/home/widgets/points_to_flag.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/providers/search_provider.dart';

import '../../../shared/providers/bottom_modal_provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomModalProvider bottomModalProvider = Provider.of<BottomModalProvider>(context, listen: true);
    SearchProvider searchProvider = Provider.of<SearchProvider>(context, listen: false);
    return Stack(
      children: [
        Container(
          height: 100.h,
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // BURGER
              GestureDetector(
                onTap: () {
                  if (bottomModalProvider.showModal) bottomModalProvider.setShowModal(showModal: false);
                  Navigator.pushNamed(context, ClientPaths.MENU);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 34.sp,
                  ),
                ),
              ),
              // CIRCLES TO FLAG
              const PointsToFlag(),
              // FORM
              Column(
                children: [
                  HomeInput(
                    placeholder: "Your location",
                    inputIndex: 0,
                    inputController: searchProvider.firstInputController,
                  ),
                  SizedBox(height: 10.h),
                  HomeInput(
                    placeholder: "Search location",
                    inputIndex: 1,
                    inputController: searchProvider.secondInputController,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
