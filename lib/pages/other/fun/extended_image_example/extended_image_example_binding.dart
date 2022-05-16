import 'package:get/get.dart';
import 'extended_image_example_controller.dart';

class ExtendedImageExampleBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<ExtendedImageExampleController>(() => ExtendedImageExampleController());
    }
}
