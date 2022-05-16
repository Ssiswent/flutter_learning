import 'package:get/get.dart';

class SliderButtonController extends GetxController {
  final count = 0.obs;

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}
