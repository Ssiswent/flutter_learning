import 'package:flutter/material.dart';
import 'package:flutter_learning/utils/extensions.dart';
import 'package:get/get.dart';
import 'my_slider_widget_controller.dart';
import 'package:flutter_learning/utils/widget_util.dart';

class MySliderWidgetPage extends StatelessWidget {
  MySliderWidgetPage({
    Key? key,
    required this.hasFinished,
  }) : super(key: key);

  final controller = Get.put(MySliderWidgetController());

  final bool hasFinished;

  @override
  Widget build(BuildContext context) {
    var totalWidth = Get.width - 32;
    return GetBuilder<MySliderWidgetController>(
      builder: (_) {
        return Container(
          color: ColorUtil.fromHex("161616"),
          width: double.infinity,
          height: 70,
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                "右滑完成",
                style: TextStyle(
                  color: ColorUtil.fromHex("8B8B8B"),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ).loc([totalWidth / 2 + 8, null, null, null]),
              GestureDetector(
                onHorizontalDragEnd: (details) => controller.onDragEnd(details),
                onHorizontalDragUpdate: (details) => controller.onDrag(details),
                onLongPress: controller.onLongPress,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "客梯车对接",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "预 16:20",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Image.asset(
                      controller.hasFinished
                          ? "images/ic_finishied.png"
                          : "images/ic_more.png",
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ],
                ).prop(
                    bgColor: ColorUtil.fromHex("525252"),
                    width: controller.dragWidgetWidth,
                    paddings: [8, 0, 8, 0]),
              ).loc([0, 0, null, 0]),
              Offstage(
                offstage: !controller.hasFinished,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "实 16:18",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ).loc([null, null, totalWidth / 2 + 8, null]),
            ],
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class MySliderWidget extends StatefulWidget {
  MySliderWidget({Key? key, required this.hasFinished}) : super(key: key);

  bool hasFinished;
  double totalWidth = Get.width - 32;
  double startWidth = (Get.width - 32) / 2;
  double dragWidgetWidth = (Get.width - 32) / 2;

  @override
  _MySliderWidgetState createState() => _MySliderWidgetState();
}

class _MySliderWidgetState extends State<MySliderWidget> {
  @override
  void initState() {
    if (widget.hasFinished) {
      widget.dragWidgetWidth = widget.totalWidth;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.fromHex("161616"),
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            "右滑完成",
            style: TextStyle(
              color: ColorUtil.fromHex("8B8B8B"),
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ).loc([widget.totalWidth / 2 + 8, null, null, null]),
          Offstage(
            offstage: !widget.hasFinished,
            child: const Center(
              child: Text(
                "撤销完成",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ).prop(width: 100, onTap: revokeBtnClicked),
          ).loc([null, 0, 0, 0]),
          GestureDetector(
            onHorizontalDragEnd: (details) => widget.hasFinished
                ? onFinishDragEnd(details)
                : onDragEnd(details),
            onHorizontalDragUpdate: (details) =>
                widget.hasFinished ? onFinishDrag(details) : onDrag(details),
            onLongPress: onLongPress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "客梯车对接",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "预 16:20",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Image.asset(
                  widget.hasFinished
                      ? "images/ic_finishied.png"
                      : "images/ic_more.png",
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ],
            ).prop(
                bgColor: ColorUtil.fromHex("525252"),
                width: widget.dragWidgetWidth,
                paddings: [8, 0, 8, 0]),
          ).loc([0, 0, null, 0]),
          Offstage(
            offstage: !widget.hasFinished,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "实 16:18",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ).loc([null, null, widget.totalWidth / 2 + 8, null]),
        ],
      ),
    );
  }

  /// 拖拽中(未完成)
  onDrag(DragUpdateDetails details) {
    widget.dragWidgetWidth += details.delta.dx;
    if (widget.dragWidgetWidth >= widget.totalWidth) {
      widget.dragWidgetWidth = widget.totalWidth;
      // finishRequest();
    }
    if (widget.dragWidgetWidth <= widget.startWidth) {
      widget.dragWidgetWidth = widget.startWidth;
    }
    setState(() {});
  }

  /// 拖拽中(已完成)
  onFinishDrag(DragUpdateDetails details) {
    widget.dragWidgetWidth += details.delta.dx;
    if (widget.dragWidgetWidth >= widget.totalWidth) {
      widget.dragWidgetWidth = widget.totalWidth;
      // finishRequest();
    }
    if (widget.dragWidgetWidth <= widget.totalWidth - 100) {
      widget.dragWidgetWidth = widget.totalWidth - 100;
    }
    setState(() {});
  }

  /// 拖拽结束(未完成)
  onDragEnd(DragEndDetails details) {
    // 到末尾自动吸附
    if (widget.dragWidgetWidth >= widget.totalWidth - 20) {
      widget.dragWidgetWidth = widget.totalWidth;
      finishRequest();
    } else if (widget.dragWidgetWidth <= widget.totalWidth) {
      // 未到末尾，回弹
      widget.dragWidgetWidth = widget.startWidth;
    }
    setState(() {});
  }

  /// 拖拽结束(已完成)
  onFinishDragEnd(DragEndDetails details) {
    // 到了撤销区域，自动吸附
    if (widget.dragWidgetWidth <= widget.totalWidth - 40) {
      widget.dragWidgetWidth = widget.totalWidth - 100;
    } else {
      // 未到彻撤销区域，直接回弹
      widget.dragWidgetWidth = widget.totalWidth;
      // finishRequest();
    }
    setState(() {});
  }

  finishRequest() {
    // 模拟网络请求，期间设置为不可操作
    Future.delayed(const Duration(seconds: 1), () {
      // 请求成功
      widget.hasFinished = true;
      // 请求失败
      // dragWidgetWidth = startWidth;
      setState(() {});
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

  revokeBtnClicked() {
    Get.dialog(
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "确定要撤销完成吗",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ).prop(margins: [16]),
            const Text(
              "撤销后，原录入时间点将会被清除",
              style: TextStyle(
                fontSize: 16,
              ),
            ).prop(margins: [0, 0, 0, 16]),
            Row(
              children: [
                const Center(
                  child: Text(
                    "取消",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ).prop(
                  bgColor: ColorUtil.fromHex("E0E0E0"),
                  expanded: 1,
                  paddings: [12],
                  onTap: () {
                    widget.dragWidgetWidth = widget.totalWidth;
                    setState(() {});
                    Get.back();
                  },
                ),
                const Center(
                  child: Text(
                    "确定",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ).prop(
                  bgColor: ColorUtil.fromHex("393939"),
                  expanded: 1,
                  paddings: [12],
                  onTap: revokeRequest,
                ),
              ],
            )
          ],
        ).prop(
          bgColor: Colors.white,
          margins: [40],
          borderRadius: [8],
        ),
      ),
      barrierDismissible: false,
    );
  }

  revokeRequest() {
    Get.back();
    // 模拟网络请求，期间设置为不可操作
    Future.delayed(const Duration(seconds: 1), () {
      // 请求成功
      widget.hasFinished = false;
      widget.dragWidgetWidth = widget.startWidth;

      // 请求失败
      // widget.dragWidgetWidth = widget.totalWidth;
      setState(() {});
    });
  }
}
