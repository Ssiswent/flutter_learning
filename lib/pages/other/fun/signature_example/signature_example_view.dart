import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/components/my_signature/my_signature_view.dart';
import 'package:flutter_learning/utils/extensions.dart';
import 'package:get/get.dart';
import 'signature_example_controller.dart';
import 'package:flutter_learning/utils/widget_util.dart';

class SignatureExamplePage extends GetView<SignatureExampleController> {
  const SignatureExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignatureExampleController>(
      builder: (_) {
        if (controller.landScape == false) {
          return Scaffold(
            backgroundColor: ColorUtil.fromHex('f7f7f9'),
            appBar: AppBar(
              title: const Text("SignatureExamplePage"),
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySignaturePage(
                    width: 400,
                    height: 300,
                    landScape: controller.landScape,
                    biggerCallback: controller.biggerCallback,
                    resetCallback: controller.resetCallback,
                    exportCallback: controller.exportCallback,
                  ).prop(
                    width: 400,
                    height: 300,
                    margins: [20],
                  ),
                  Center(
                    child: controller.exportedImg != null
                        ? controller.exportedImg!
                        : const Text("导出的图片"),
                  ).prop(
                    width: 200,
                    height: 150,
                    bgColor: Colors.white,
                    margins: [20],
                  )
                ],
              ),
            ),
          );
        } else {
          // 手写板横屏
          return Scaffold(
            backgroundColor: ColorUtil.fromHex('f7f7f9'),
            body: MySignaturePage(
              width: ScreenUtil.getInstance().screenHeight,
              height: ScreenUtil.getInstance().screenWidth,
              landScape: controller.landScape,
              resetCallback: controller.resetCallback,
              exportCallback: controller.exportCallback,
            ).prop(
              width: ScreenUtil.getInstance().screenWidth,
              height: ScreenUtil.getInstance().screenHeight,
            ),
          );
        }
      },
    );
  }
}
