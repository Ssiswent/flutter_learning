import 'package:get/get.dart';
import 'signature_example_controller.dart';

class SignatureExampleBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SignatureExampleController>(() => SignatureExampleController());
    }
}
