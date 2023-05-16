import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FocusController extends GetxController {
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();

  final textController = TextEditingController();

  @override
  void onReady() {}

  @override
  void onClose() {}

  selectDate({required BuildContext context}) {
    log('PickerViewOpened');
    FocusScope.of(context).requestFocus(FocusNode());
    showSelectedTimePicker(
      context: context,
      title: '请选择',
      back: (s) {
        log('PickerView selected');
        textController.text = s.substring(0, 10);
        // log('node------$node');
        // node.nextFocus();
        // FocusScope.of(context).requestFocus(node);
      },
      dateType: PickerDateTimeType.kYMD,
    );
  }

  showSelectedTimePicker({
    required BuildContext context,
    required ValueSetter<String> back,
    String title = "",
    int dateType = PickerDateTimeType.kYMDHM,
    DateTime? defaultTime,
    DateTime? maxValue,
  }) {
    const itemExtent = 42.0;
    const bgColor = Color(0xFF272836);
    const txtColor = Color(0xFFFFFFFF);
    final selectColor = Colors.black.withOpacity(0.20);
    // DateTime maxValue = DateTime.now().add(const Duration(hours: 3));
    Picker(
        looping: true,
        itemExtent: itemExtent,
        backgroundColor: bgColor,
        containerColor: bgColor,
        selectionOverlay: Container(height: itemExtent, color: selectColor),
        headerDecoration: BoxDecoration(color: Colors.black.withOpacity(0.05)),
        textStyle: const TextStyle(color: txtColor, fontSize: 16),
        cancelTextStyle: TextStyle(color: const Color(0xFFFFFFFF).withOpacity(0.50), fontSize: 14),
        confirmTextStyle: const TextStyle(color: Color(0xFF4EE39B), fontSize: 14),
        selectedTextStyle: const TextStyle(color: txtColor, fontSize: 20),
        adapter: DateTimePickerAdapter(
          type: dateType,
          isNumberMonth: true,
          yearSuffix: "年",
          monthSuffix: "月",
          daySuffix: "日",
          maxValue: maxValue ?? DateTime.now().add(const Duration(hours: 3)),
          yearBegin: DateTime.now().year - 5,
          value: defaultTime ?? DateTime.now(),
        ),
        title: Text(title, style: const TextStyle(color: txtColor, fontSize: 14)),
        onConfirm: (Picker picker, List value) {
          if (kDebugMode) {
            print(picker.adapter.text);
          }
          back(picker.adapter.text);
        }).showModal(context, builder: (context, view) {
      return Material(
          elevation: 0.0,
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: view,
          ));
    }, backgroundColor: bgColor);
  }
}
