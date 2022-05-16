import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class StyledDatepickerController extends GetxController {
  @override
  void onReady() {}

  @override
  void onClose() {}

  onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    var range = args.value;
    if (range is PickerDateRange) {
      if (kDebugMode) {
        print(range.startDate);
        print(range.endDate);
      }
    }
  }
}
