import 'package:get/get.dart';
import 'staggered_grid_view_controller.dart';

class StaggeredGridViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaggeredGridViewController>(
        () => StaggeredGridViewController());
  }
}
