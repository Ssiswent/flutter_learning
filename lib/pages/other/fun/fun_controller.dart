import 'package:flutter_learning/routes/routes.dart';
import 'package:get/get.dart';

class FunController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  toStaggeredGridViewPage() {
    Get.toNamed(RouteConfig.staggeredGridView);
  }
}
