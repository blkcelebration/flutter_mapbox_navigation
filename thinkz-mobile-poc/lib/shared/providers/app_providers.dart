// ignore_for_file: non_constant_identifier_names

import 'package:thinkz/shared/providers/bottom_modal_provider.dart';
import 'package:thinkz/shared/providers/carousel_provider.dart';
import 'package:thinkz/shared/providers/loading_provider.dart';
import 'package:thinkz/shared/providers/mapbox_provider.dart';
import 'package:thinkz/shared/providers/search_provider.dart';
import 'package:thinkz/shared/providers/test_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> AppProviders = [
  ChangeNotifierProvider<TestProvider>(create: (_) => TestProvider()),
  ChangeNotifierProvider<BottomModalProvider>(create: (_) => BottomModalProvider()),
  ChangeNotifierProvider<MapboxProvider>(create: (_) => MapboxProvider()),
  ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
  ChangeNotifierProvider<LoadingProvider>(create: (_) => LoadingProvider()),
  ChangeNotifierProvider<CarouselProvider>(create: (_) => CarouselProvider()),
];
