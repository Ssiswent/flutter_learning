import 'package:flutter/material.dart';
import 'package:flutter_learning/utils/extensions.dart';
import 'package:get/get.dart';
import 'my_signature_controller.dart';
import 'package:signature/signature.dart';
import 'package:flutter_learning/utils/widget_util.dart';

class MySignaturePage extends StatelessWidget {
  MySignaturePage({
    Key? key,
    this.biggerCallback,
    this.resetCallback,
    required this.exportCallback,
    required this.width,
    required this.height,
    required this.landScape,
  }) : super(key: key);

  final controller = Get.put(MySignatureController());

  final VoidCallback? biggerCallback; // 放大回调
  final VoidCallback? resetCallback; // 还原大小回调
  final ValueSetter<Image?> exportCallback; // 导出回调
  final double width;
  final double height;
  final bool landScape; // 是否横屏

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySignatureController>(
      builder: (_) {
        return RotatedBox(
          quarterTurns: landScape ? 1 : 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              IgnorePointer(
                ignoring: !controller.canEdit,
                child: Signature(
                  controller: controller.signatureController,
                  width: width,
                  height: height,
                  backgroundColor: Colors.white,
                ),
              ),
              // 暂无签名(无签名且无描线显示)
              IgnorePointer(
                child: Offstage(
                  offstage:
                      (controller.isEmpty && controller.signatureImg == null)
                          ? false
                          : true,
                  child: Text(
                    '  签名（必填）',
                    style: TextStyle(
                      fontSize: 44,
                      color: ColorUtil.fromHex("A5ACB4"),
                    ),
                  ),
                ),
              ),
              //生成的签名(有签名且不是编辑状态下显示)
              Offstage(
                offstage:
                    (controller.signatureImg != null && !controller.canEdit)
                        ? false
                        : true,
                child: Center(child: controller.signatureImg),
              ).loc([0, 0, 0, 0]),
              // 编辑和完成按钮
              Positioned(
                bottom: 0,
                left: landScape ? 44 : 0,
                child: Text(
                  !controller.canEdit ? '编辑' : '完成',
                  style: const TextStyle(color: Colors.white),
                ).prop(
                  onTap: () {
                    controller.editBtnClicked(exportCallback);
                    if (landScape) {
                      if (resetCallback != null) {
                        resetCallback!();
                      }
                    }
                  },
                  bgColor: Colors.blue,
                  borderRadius: [10],
                  paddings: [8, 4, 8, 4],
                  margins: [10],
                ),
              ),
              // 放大按钮
              Positioned(
                top: 0,
                right: 0,
                child: Offstage(
                  offstage: landScape || !controller.canEdit,
                  child: const Icon(Icons.fullscreen_rounded).prop(
                      onTap: () {
                        if (biggerCallback != null) {
                          biggerCallback!();
                        }
                      },
                      paddings: [10]),
                ),
              ),
              // 橡皮按钮
              Positioned(
                bottom: 0,
                right: landScape ? 10 : 0,
                child: Row(
                  children: [
                    // 橡皮
                    Offstage(
                      offstage: !controller.canEdit,
                      child: const Icon(Icons.clear_rounded).prop(
                        margins: [10],
                        onTap: controller.cleanPad,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
