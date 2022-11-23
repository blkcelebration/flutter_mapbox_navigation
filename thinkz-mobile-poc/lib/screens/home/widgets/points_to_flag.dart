import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsToFlag extends StatelessWidget {
  const PointsToFlag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5.h),
        CircleAvatar(
          radius: 11.sp,
          backgroundColor: Colors.white.withOpacity(0.3),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 171, 46, 54),
            radius: 6.sp,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 1.sp,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        CircleAvatar(backgroundColor: Colors.white, radius: 1.sp),
        SizedBox(height: 4.h),
        CircleAvatar(backgroundColor: Colors.white, radius: 1.sp),
        SizedBox(height: 4.h),
        CircleAvatar(backgroundColor: Colors.white, radius: 1.sp),
        SizedBox(height: 4.h),
        CircleAvatar(backgroundColor: Colors.white, radius: 1.sp),
        SizedBox(height: 8.h),
        Icon(
          Icons.flag,
          color: Colors.white,
          size: 15.sp,
        ),
      ],
    );
  }
}
