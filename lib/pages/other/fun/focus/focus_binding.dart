import 'package:get/get.dart';
import 'focus_controller.dart';

class FocusBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<FocusController>(() => FocusController());
    }
}
