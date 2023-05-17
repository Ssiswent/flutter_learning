import 'dart:developer';

import 'package:get/get.dart';

class FlutterController extends GetxController {
  FlutterController();

  _initData() {
    update(["flutter"]);
  }

  void onTap() {
    final json = {'name': 'Michael', 'height': 180};
    // Find Michael's height.
    if (json case {'name': 'Michael', 'height': int h}) {
      print('Michael is $h cm tall.');
    } else {
      print('Error: json contains no height info for Michael!');
    }
    var (String name, int height) = userInfo(json);
    log('name: $name');
    log('height: $height');
    var dt = DateTime.now();
    log('describeDate: ${describeDate(dt)}');
  }

  (String, int) userInfo(Map<String, dynamic> json) {
    return (json['name'] as String, json['height'] as int);
  }

  String describeDate(DateTime dt) =>
      switch (dt.weekday) { 1 => 'Feeling the Monday blues?', 6 || 7 => 'Enjoy the weekend!', _ => 'Hang in there.' };

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
