import 'package:get/get.dart';
import 'my_signature_controller.dart';

class MySignatureBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<MySignatureController>(() => MySignatureController());
    }
}
