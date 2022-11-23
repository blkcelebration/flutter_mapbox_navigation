import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';
import 'package:thinkz/shared/services/api/search_auto_complete.dart';
import 'package:thinkz/shared/styles/color_scheme.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer? timer;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    MapboxProvider mapboxProvider = Provider.of<MapboxProvider>(context, listen: false);
    await mapboxProvider.initialize(mounted: mounted);
    navigateToNewScreen();
  }

  void navigateToNewScreen() {
    timer = Timer(const Duration(milliseconds: 800), () {
      Navigator.pushNamedAndRemoveUntil(context, ClientPaths.HOME, (route) => false);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.black,
      Color.fromARGB(255, 119, 24, 18),
      Colors.red,
      Color.fromARGB(255, 120, 13, 5),
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 24.0,
      fontFamily: 'Horizon',
    );
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  child: Image.asset("assets/images/temp_icon.png"),
                ),
                const SizedBox(height: 10),
                AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Thinkz',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      speed: const Duration(
                        milliseconds: 800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 68.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColors.red1,
                backgroundColor: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
