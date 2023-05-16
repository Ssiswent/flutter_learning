import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_learning/utils/widget_util.dart';

class MySliderWidgetController extends GetxController {
  double totalWidth = Get.width - 32;
  double startWidth = (Get.width - 32) / 2;
  double dragWidgetWidth = (Get.width - 32) / 2;

  bool hasFinished = false;

  @override
  void onReady() {}

  @override
  void onClose() {}

  /// 拖拽中
  onDrag(DragUpdateDetails details) {
    dragWidgetWidth += details.delta.dx;
    if (dragWidgetWidth >= totalWidth) {
      dragWidgetWidth = totalWidth;
      // finishRequest();
    }
    if (dragWidgetWidth <= startWidth) {
      dragWidgetWidth = startWidth;
    }
    update();
  }

  /// 拖拽结束
  onDragEnd(DragEndDetails details) {
    // 到末尾自动吸附
    if (dragWidgetWidth >= totalWidth - 20) {
      dragWidgetWidth = totalWidth;
      finishRequest();
    } else if (dragWidgetWidth <= totalWidth) {
      // 未到末尾，回弹
      dragWidgetWidth = startWidth;
    }
    update();
  }

  finishRequest() {
    // 模拟网络请求，期间设置为不可操作
    Future.delayed(const Duration(seconds: 1), () {
      // 请求成功
      hasFinished = true;
      // 请求失败
      // dragWidgetWidth = startWidth;
      update();
    });
  }

  onLongPress() {
    Get.dialog(
      Center(
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("修改开始时间"),
            ),
            ListTile(title: Text("修改结束时间")),
            ListTile(title: Text("撤销完成")),
            ListTile(title: Text("复制节点")),
            ListTile(title: Text("删除节点")),
          ],
        ).prop(
          bgColor: Colors.white,
          // margins: [40],
          // paddings: [20],
          width: 144,
          // height: 280,
          borderRadius: [8],
        ),
      ),
    );
  }
}
