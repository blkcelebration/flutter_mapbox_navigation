import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';
import 'package:thinkz/shared/providers/search_provider.dart';

class HomeInput extends StatefulWidget {
  final TextEditingController? inputController;
  final int inputIndex;
  final String placeholder;
  const HomeInput({
    Key? key,
    required this.placeholder,
    required this.inputIndex,
    this.inputController,
  }) : super(key: key);

  @override
  State<HomeInput> createState() => _HomeInputState();
}

class _HomeInputState extends State<HomeInput> {
  Timer? debounce;

  @override
  void initState() {
    if (widget.inputIndex == 0) {
      SearchProvider searchProvider = Provider.of<SearchProvider>(context, listen: false);
      MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
      searchProvider.userLocationData = mapboxProvider.locationData;
      searchProvider.autoFillFirstInputToUserLocation();
    }
    super.initState();
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context, listen: true);
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: true);
    return SizedBox(
      width: 260.w,
      height: 34.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
          SizedBox(
            width: 230.w,
            child: TextField(
              controller: widget.inputController,
              onChanged: (input) {
                if (debounce?.isActive ?? false) debounce?.cancel();
                debounce = Timer(const Duration(milliseconds: 100), () {
                  searchProvider.onUserInput(
                    inputIndex: widget.inputIndex,
                    search: input,
                    context: context,
                  );
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 42.w),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14.sp),
                hintText: widget.placeholder,
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () => searchProvider.onCloseIconPressed(widget.inputIndex, context),
              child: Container(
                height: 34.h,
                padding: EdgeInsets.only(right: 8.w),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
