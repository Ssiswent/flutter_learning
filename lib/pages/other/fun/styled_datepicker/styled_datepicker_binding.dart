import 'package:get/get.dart';
import 'styled_datepicker_controller.dart';

class StyledDatepickerBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<StyledDatepickerController>(() => StyledDatepickerController());
    }
}
