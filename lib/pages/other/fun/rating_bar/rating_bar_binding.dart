import 'package:get/get.dart';
import 'rating_bar_controller.dart';

class RatingBarBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<RatingBarController>(() => RatingBarController());
    }
}
