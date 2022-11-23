import 'package:thinkz/shared/models/test/test_model.dart';
import 'package:thinkz/shared/services/api/api.dart';
import 'package:flutter/cupertino.dart';

class TestProvider extends ChangeNotifier {
  TestModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await HttpService.getSinglePostData())!;
    loading = false;

    notifyListeners();
  }
}
