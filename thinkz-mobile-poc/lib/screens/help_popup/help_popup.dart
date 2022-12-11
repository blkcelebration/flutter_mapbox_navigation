import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HelpPopupScreen extends StatelessWidget {
  const HelpPopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle iconTextStyle = TextStyle(
      color: Colors.grey.shade800,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(top: 128.h),
          width: double.infinity,
          color: Colors.grey[400],
          child: Column(
            children: [
              IconButton(
                padding: EdgeInsets.symmetric(vertical: 25.h),
                icon: const Icon(Icons.close, size: 35, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Column(
                            children: [
                              Text(
                                'Your wellness is important to us At Thinkz!',
                                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center,
                                softWrap: true,
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 24.h),
                                child: Text(
                                  'Taking air quality into account when selecting a route is now possible.',
                                  style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: Text(
                                  'Our recommendation considers duration, length, and air quality. The colors of the recommended routes are delicately graded, so Green is better than Orange which is better than Red.',
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 18.sp),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.grey.shade600),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              'The recommendations are presented on the map, and in 3 buttons at the right hand side of the screen. Please select the desired route b pressing one of the buttons, select ',
                                          style: TextStyle(
                                            fontSize: 35.sp,
                                          ),
                                        ),
                                        TextSpan(
                                            text: 'START',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 38.sp,
                                              decoration: TextDecoration.underline,
                                              decorationColor: Colors.black,
                                            )),
                                        TextSpan(
                                          text: ' at the bottom of the screen and begin your walk!',
                                          style: TextStyle(
                                            fontSize: 35.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    textScaleFactor: 0.5,
                                  )),
                              Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 30.h),
                                  padding: EdgeInsets.only(bottom: 15.h),
                                  child: SvgPicture.asset('assets/images/location-green.svg')),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  'From green which is a combination of time and air quality that we most recommend using',
                                  style: iconTextStyle,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: SvgPicture.asset('assets/images/location-orange.svg')),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  'Average combination of air pollution along with the length of the route',
                                  style: iconTextStyle,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: SvgPicture.asset('assets/images/location-red.svg')),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: Text(
                                  'The route we least recommend using',
                                  style: iconTextStyle,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 320.w,
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                border: const Border(
                                  top: BorderSide(width: 1, color: Colors.transparent),
                                  bottom: BorderSide(width: 1, color: Colors.transparent),
                                  right: BorderSide(width: 1, color: Colors.transparent),
                                  left: BorderSide(width: 1, color: Colors.transparent),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 0.8,
                                    blurRadius: 5,
                                    offset: Offset(0, 3.5),
                                  ),
                                ]),
                            child: Text('Thanks, Got it',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.blue,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
