import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/other/fun/my_slider_widget/my_slider_widget_view.dart';
import 'package:get/get.dart';
import 'my_slider_list_controller.dart';

class MySliderListPage extends GetView<MySliderListController> {
  const MySliderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MySliderList"),
      ),
      body: ListView(
        children: [
          MySliderWidget(hasFinished: false),
          MySliderWidget(hasFinished: false),
          MySliderWidget(hasFinished: true),
        ],
      ),
    );
  }
}
