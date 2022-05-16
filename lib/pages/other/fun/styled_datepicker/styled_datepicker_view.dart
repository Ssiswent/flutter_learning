import 'package:flutter/material.dart';
import 'package:flutter_learning/utils/widget_util.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'styled_datepicker_controller.dart';

class StyledDatepickerPage extends GetView<StyledDatepickerController> {
  const StyledDatepickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SyncfusionDatepicker"),
      ),
      body: ListView(
        children: [
          SfDateRangePicker(
            onSelectionChanged: controller.onSelectionChanged,
            // view: DateRangePickerView.year,
            monthViewSettings: DateRangePickerMonthViewSettings(
              firstDayOfWeek: 1,
              blackoutDates: [DateTime(2022, 1, 20)],
              specialDates: [DateTime(2022, 1, 27)],
            ),
            monthCellStyle: DateRangePickerMonthCellStyle(
              specialDatesTextStyle: const TextStyle(color: Colors.white),
              specialDatesDecoration: BoxDecoration(
                  color: Colors.brown,
                  border: Border.all(color: Colors.yellow, width: 1),
                  shape: BoxShape.circle),
            ),
            selectionMode: DateRangePickerSelectionMode.range,
            showActionButtons: true,
            confirmText: "确定",
            cancelText: "取消",
            showTodayButton: true,
            selectableDayPredicate: (date) {
              var dateList = [
                DateTime(2022, 1, 10),
                DateTime(2022, 1, 11),
                DateTime(2022, 1, 12),
              ];
              if (dateList.contains(date)) {
                return false;
              } else {
                return true;
              }
            },
          ).prop(width: double.infinity, height: 400)
        ],
      ),
    );
  }
}
