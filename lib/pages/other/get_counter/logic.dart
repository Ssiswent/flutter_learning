import 'package:get/get.dart';

class CounterLogic extends GetxController {
  var count = 0;

  ///自增
  void increase() {
    ++count;
    update();
  }
}
