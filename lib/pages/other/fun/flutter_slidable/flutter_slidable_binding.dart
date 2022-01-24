import 'package:get/get.dart';
import 'flutter_slidable_controller.dart';

class FlutterSlidableBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<FlutterSlidableController>(() => FlutterSlidableController());
    }
}
