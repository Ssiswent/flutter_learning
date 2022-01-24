import 'package:get/get.dart';
import 'implicitly_animated_reorderable_list_controller.dart';

class ImplicitlyAnimatedReorderableListBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<ImplicitlyAnimatedReorderableListController>(() => ImplicitlyAnimatedReorderableListController());
    }
}
