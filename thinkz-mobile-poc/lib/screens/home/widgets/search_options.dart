import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/screens/home/widgets/search_option_item.dart';
import 'package:thinkz/shared/providers/search_provider.dart';
import 'package:thinkz/shared/styles/styles.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context, listen: true);
    bool showForFirstInput = searchProvider.showSearchOptionsInputOne;
    bool showForSecondInput = searchProvider.showSearchOptionsInputTwo;
    if (!showForFirstInput && !showForSecondInput) return const SizedBox();
    return Positioned(
      left: 84.w,
      top: showForFirstInput ? 50.h : 92.h,
      child: SafeArea(
        child: Container(
          width: 264.w,
          constraints: BoxConstraints(minHeight: 40.h, maxHeight: 400.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: SharedStyles.shadow,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (searchProvider.isLoading) const SearchOptionItem(name: "Loading..."),
                if (searchProvider.isLoading == false) ...searchProvider.searchOptions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
