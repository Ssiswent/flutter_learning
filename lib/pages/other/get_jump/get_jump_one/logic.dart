import 'package:flutter_learning/routes/routes.dart';
import 'package:get/get.dart';

class GetJumpOneLogic extends GetxController {
  var count = 0;

  ///跳转到跨页面
  void toJumpTwo() {
    Get.toNamed(RouteConfig.getJumpTwo, arguments: {'msg': '我是上个页面传递过来的数据'});
  }

  void increase() {
    count = ++count;
    update();
  }
}
