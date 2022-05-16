import 'package:get/get.dart';
import 'audio_services_controller.dart';

class AudioServicesBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<AudioServicesController>(() => AudioServicesController());
    }
}
