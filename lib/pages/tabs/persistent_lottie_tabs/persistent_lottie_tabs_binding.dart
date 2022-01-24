import 'package:get/get.dart';
import 'persistent_lottie_tabs_controller.dart';

class PersistentLottieTabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersistentLottieTabsController>(
        () => PersistentLottieTabsController());
  }
}
