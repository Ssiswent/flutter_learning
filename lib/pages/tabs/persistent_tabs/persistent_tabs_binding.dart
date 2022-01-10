import 'package:get/get.dart';
import 'persistent_tabs_controller.dart';

class PersistentTabsBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<PersistentTabsController>(() => PersistentTabsController());
    }
}
