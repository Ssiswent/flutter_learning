import 'package:get/get.dart';

import 'state.dart';

class GetStateCounterLogic extends GetxController {
  final GetStateCounterState state = GetStateCounterState();

  ///自增
  void increase() {
    state.count = ++state.count;
    update();
  }
}
