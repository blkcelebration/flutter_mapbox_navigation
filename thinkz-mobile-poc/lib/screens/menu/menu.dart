import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/styles/color_scheme.dart';
import 'package:thinkz/shared/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/consts/paths.dart';
import '../../shared/providers/bottom_modal_provider.dart';
import '../../shared/services/urlLauncher/UrlLauncher.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  void onStringTapped({required String menuCategory, required BuildContext context}) async {
    if (menuCategory == "Help") Navigator.popAndPushNamed(context, ClientPaths.HELP_POPUP);
    if (menuCategory == "About") UrlLauncher.openWebsite(ThinkzConstants.SITE_ADDRESS);
    if (menuCategory == "Contact us") UrlLauncher.openMail(ThinkzConstants.CONTACTS_EMAIL);
    if (menuCategory == "Share") {}
  }

  @override
  Widget build(BuildContext context) {
    List<String> str = ["About", "Help", "Contact us", "Share"];
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Container(
        color: Colors.white.withOpacity(0.3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
            ),
            boxShadow: SharedStyles.shadow,
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.01, 0.5, 1.0],
              colors: [
                Color.fromARGB(255, 201, 36, 25),
                Color.fromARGB(255, 171, 31, 21),
                Color.fromARGB(255, 155, 21, 12),
              ],
            ),
          ),
          width: 280.w,
          height: 600.h,
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    // HEADING
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 14.h),
                        child: Text(
                          "Menu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    // ICON
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: EdgeInsets.only(top: 8.h, bottom: 14.h, left: 10.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 34.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // BODY
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 0.h, left: 20.w),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    // ITEMS
                    child: Column(
                      children: str.map((menuCategory) {
                        return GestureDetector(
                          onTap: () => onStringTapped(menuCategory: menuCategory, context: context),
                          child: Column(
                            children: [
                              SizedBox(height: 24.h),
                              Row(
                                children: [
                                  Text(
                                    "\u2022",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.red1,
                                    ),
                                  ), //bullet text
                                  SizedBox(
                                    width: 13.w,
                                  ), //space between bullet and text
                                  Expanded(
                                    child: Text(
                                      menuCategory,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ), //text
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
