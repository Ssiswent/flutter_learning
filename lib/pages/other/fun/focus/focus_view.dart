import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'focus_controller.dart';
import 'package:flutter_learning/utils/widget_util.dart';

import 'focusable_widget.dart';

class FocusPage extends GetView<FocusController> {
  const FocusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Focus"),
      ),
      body: EasyTextFieldView(controller: controller),
    );
  }
}

class EasyTextFieldView extends StatelessWidget {
  const EasyTextFieldView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final FocusController controller;

  @override
  Widget build(BuildContext context) {
    // FocusNode node2 = FocusNode();
    // node2.addListener(() {
    //   if (node2.hasFocus) {
    //     log('------Focused');
    //     controller.selectDate(context: context, node: node2);
    //   } else {
    //     log('------Leave Focused');
    //   }
    // });
    return FocusScope(
      child: ListView(
        children: [
          // 1
          TextField(
            focusNode: controller.node1,
            textInputAction: TextInputAction.next,
            // onEditingComplete: () => log('TextField 1------onEditingComplete'),
            onSubmitted: (value) => log('TextField 1------onSubmitted: $value'),
            decoration: const InputDecoration(labelText: '1', border: InputBorder.none),
          ).prop(
            margins: [24, 32, 24, 16],
            paddings: [16, 0, 16, 0],
            borderRadius: [12],
            bgColor: const Color(0x1A4A91CA),
          ),
          // const Text('data').prop(
          //   margins: [24, 32, 24, 16],
          //   paddings: [16, 0, 16, 0],
          //   borderRadius: [12],
          //   bgColor: const Color(0x1A4A91CA),
          // ),
          FocusableWidget(
            focusNode: controller.node2,
            onFocused: () => controller.selectDate(context: context),
            // onFocusedCallback: (node) => controller.selectDate(context: context, node: node),
            child: TextField(
              controller: controller.textController,
              readOnly: true,
              // enabled: false,
              decoration: const InputDecoration(
                labelText: "用户名",
                border: OutlineInputBorder(),
              ),
            ).prop(
              margins: [24, 16, 24, 16],
              // paddings: [16, 0, 16, 0],
              // borderRadius: [12],
              bgColor: const Color(0x1A4A91CA),
            ),
          ),
          // 3
          TextField(
            // focusNode: FocusNode(skipTraversal: true),
            focusNode: controller.node3,
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              log('TextField 3------onEditingComplete');
              FocusScope.of(context).requestFocus(controller.node4);
            },
            onSubmitted: (value) => log('TextField 3------onSubmitted: $value'),
            decoration: const InputDecoration(labelText: '3', border: InputBorder.none),
          ).prop(
            onTap: () => null,
            margins: [24, 16, 24, 16],
            paddings: [16, 0, 16, 0],
            borderRadius: [12],
            bgColor: const Color(0x1A4A91CA),
          ),
          // 4
          TextField(
            focusNode: controller.node4,
            textInputAction: TextInputAction.done,
            onEditingComplete: () {
              log('TextField 4------onEditingComplete');
              FocusScope.of(context).requestFocus(FocusNode());
            },
            onSubmitted: (value) => log('TextField 4------onSubmitted: $value'),
            maxLines: 1,
            decoration: const InputDecoration(labelText: '4', border: InputBorder.none),
          ).prop(
            margins: [24, 16, 24, 16],
            paddings: [16, 0, 16, 0],
            borderRadius: [12],
            bgColor: const Color(0x1A4A91CA),
          ),
        ],
      ),
    );
  }
}
