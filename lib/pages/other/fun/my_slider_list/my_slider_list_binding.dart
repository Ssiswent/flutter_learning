import 'package:get/get.dart';
import 'my_slider_list_controller.dart';

class MySliderListBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<MySliderListController>(() => MySliderListController());
    }
}
