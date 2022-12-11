import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/providers/bottom_modal_provider.dart';

class BottomModalDownArrow extends StatelessWidget {
  const BottomModalDownArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomModalProvider provider = Provider.of<BottomModalProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => provider.setShowModal(showModal: false),
      child: Align(
        alignment: Alignment.topCenter,
        child: Icon(
          Icons.arrow_drop_down,
          color: Colors.black.withOpacity(0.3),
          size: 36.sp,
        ),
      ),
    );
  }
}
