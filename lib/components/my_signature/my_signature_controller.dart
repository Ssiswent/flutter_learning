import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:flutter/material.dart';

class MySignatureController extends GetxController {
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 2, // 线条宽度
    penColor: Colors.black, // 线条颜色
    exportBackgroundColor: Colors.transparent, // 导出图片背景色
  );

  bool isEmpty = true;
  bool canEdit = false;

  Image? signatureImg;

  @override
  void onInit() {
    // 监听画板
    signatureController.addListener(() {
      bool tmpIsEmpty = true;
      if (signatureController.isNotEmpty) {
        tmpIsEmpty = false;
      } else {
        tmpIsEmpty = true;
      }
      if (isEmpty != tmpIsEmpty) {
        isEmpty = tmpIsEmpty;
        update();
      }
    });
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  editBtnClicked(ValueSetter<Image?> exportCallback) async {
    canEdit = !canEdit;
    // 点击完成且已经签名
    if (!canEdit && signatureController.isNotEmpty) {
      final Uint8List? data = await signatureController.toPngBytes();
      if (data != null) {
        signatureImg = Image.memory(data);
        signatureController.clear();
      }
      update();
    } else {
      signatureImg = null;
      update();
    }
    exportCallback(signatureImg);
  }

  cleanPad() {
    signatureController.clear();
    update();
  }

  Future<Image?> exportImage() async {
    if (signatureController.isNotEmpty) {
      final Uint8List? data = await signatureController.toPngBytes();
      if (data != null) {
        return Image.memory(data);
      } else {
        return null;
      }
    }
  }
}
