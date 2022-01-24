import 'package:get/get.dart';
import 'get_bindings_controller.dart';

class GetBindingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetBindingsController>(() => GetBindingsController());
  }
}
