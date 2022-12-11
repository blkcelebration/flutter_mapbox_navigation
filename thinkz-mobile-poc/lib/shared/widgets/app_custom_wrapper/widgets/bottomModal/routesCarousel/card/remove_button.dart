import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/providers/search_provider.dart';

import '../../../../../../styles/styles.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context, listen: true);
    return GestureDetector(
      onTap: () => searchProvider.onCloseIconPressed(1, context),
      child: Container(
        width: 25.w,
        height: 20.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          boxShadow: SharedStyles.shadow,
          color: Colors.white
        ),
        child: const Icon(
          Icons.close,
          size: 20,
        )
      ),
    );;
  }
}