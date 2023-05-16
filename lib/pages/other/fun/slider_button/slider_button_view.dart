import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/utils/extensions.dart';
import 'package:get/get.dart';
import 'slider_button_controller.dart';
import 'package:flutter_learning/utils/widget_util.dart';
import 'package:slider_button/slider_button.dart';

class SliderButtonPage extends GetView<SliderButtonController> {
  const SliderButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalWidth = ScreenUtil.getInstance().screenWidth - 32;
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliderButton"),
      ),
      body: ListView(
        children: [
          ListItem(totalWidth: totalWidth),
          ListItem(totalWidth: totalWidth),
          ListItem(totalWidth: totalWidth),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.totalWidth,
  }) : super(key: key);

  final double totalWidth;

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      action: () {},
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
          Row(
            children: [
              Icon(Icons.chevron_right_rounded,
                  color: ColorUtil.fromHex("8B8B8B")),
              Icon(Icons.chevron_right_rounded,
                  color: ColorUtil.fromHex("8B8B8B")),
              Icon(Icons.chevron_right_rounded,
                  color: ColorUtil.fromHex("8B8B8B")),
            ],
          )
        ],
      ).prop(
          bgColor: ColorUtil.fromHex("525252"),
          width: totalWidth / 2,
          paddings: [8, 0, 0, 0]),
      label: Text(
        "右滑完成",
        style: TextStyle(
          color: ColorUtil.fromHex("8B8B8B"),
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      width: totalWidth / 2 + 70,
      //60
      buttonSize: 70,
      //70
      //height: 100,
      radius: 0,
      backgroundColor: ColorUtil.fromHex("161616"),
      shimmer: false,
      dismissible: false,
      // dismissThresholds: 1,
      vibrationFlag: true,
    ).prop(margins: [16, 16, 16, 0]);
  }
}
