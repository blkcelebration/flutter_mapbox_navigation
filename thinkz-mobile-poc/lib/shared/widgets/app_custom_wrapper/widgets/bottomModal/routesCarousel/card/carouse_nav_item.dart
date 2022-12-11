import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselNavItem extends StatelessWidget {
  final bool active;
  const CarouselNavItem({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        width: active ? 20.w : 10.w,
        height: 2.h,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        color: active ? Colors.black :Color(0xffc8c8c8)
      );
  }
}