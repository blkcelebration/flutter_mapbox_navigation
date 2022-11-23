import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/models/google_auto_complete/place_result_model.dart';
import 'package:thinkz/shared/models/search_auto_complete/search_auto_feature_model.dart';
import 'package:thinkz/shared/providers/search_provider.dart';

class SearchOptionItem extends StatelessWidget {
  final String name;
  final String? placeId;
  //final PlaceResultModel? locationInfo;
  const SearchOptionItem({Key? key, required this.name, this.placeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context, listen: false);

    return GestureDetector(
      onTap: () => searchProvider.onLocationChosen(address: name, placeId: placeId ?? "", context: context),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
        padding: EdgeInsets.only(left: 24.w, top: 10.h, bottom: 10.h, right: 10),
        child: Text(
          name,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black.withOpacity(0.65),
            fontSize: 18.sp,
            fontFamily: 'Robroto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
