import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignatureExampleController extends GetxController {
  bool landScape = false;

  Image? exportedImg;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  biggerCallback() {
    landScape = true;
    update();
  }

  resetCallback() {
    landScape = false;
    update();
  }

  exportCallback(img) {
    exportedImg = img;
    update();
  }
}
