import 'package:get/get.dart';
import 'percent_indicator_controller.dart';

class PercentIndicatorBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<PercentIndicatorController>(() => PercentIndicatorController());
    }
}
