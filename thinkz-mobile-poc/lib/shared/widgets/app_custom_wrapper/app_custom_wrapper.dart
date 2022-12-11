import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:thinkz/shared/widgets/app_custom_wrapper/widgets/shared_loading_modal.dart';

import 'widgets/bottomModal/bottom_modal.dart';

class AppCustomWrapper extends StatelessWidget {
  final Widget child;
  const AppCustomWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        const BottomModal(),
        const SharedLoadingModal(),
      ],
    );
  }
}
