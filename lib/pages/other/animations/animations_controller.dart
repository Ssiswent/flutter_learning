import 'package:flutter_learning/pages/other/animations/hero_animations/hero_animations_view.dart';
import 'package:get/get.dart';

class AnimationsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  toHeroAnimationsPage() {
    Get.to(() => const HeroAnimationsPage());
  }
}
