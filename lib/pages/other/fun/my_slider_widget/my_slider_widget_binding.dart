import 'package:get/get.dart';
import 'my_slider_widget_controller.dart';

class MySliderWidgetBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<MySliderWidgetController>(() => MySliderWidgetController());
    }
}
