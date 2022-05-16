import 'package:get/get.dart';
import 'slider_button_controller.dart';

class SliderButtonBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SliderButtonController>(() => SliderButtonController());
    }
}
