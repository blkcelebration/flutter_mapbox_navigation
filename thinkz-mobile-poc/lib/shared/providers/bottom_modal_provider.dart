import 'package:flutter/material.dart';

class BottomModalProvider extends ChangeNotifier {
  bool showModal = false;
  Color? color;
  void setShowModal({required bool showModal, Color? color}) {
    this.showModal = showModal;
    if (color != null) {
      this.color = color;
    }
    notifyListeners();
  }
}
