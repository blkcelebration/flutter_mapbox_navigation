import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool isLoading = false;

  void setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
    notifyListeners();
  }
}
