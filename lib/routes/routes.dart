import 'package:flutter_learning/pages/other/get_jump/get_jump_one/view.dart';
import 'package:flutter_learning/pages/other/get_jump/get_jump_two/view.dart';
import 'package:flutter_learning/pages/tabs/tabs.dart';
import 'package:get/get.dart';

class RouteConfig {
  /// 主页面
  static const String main = "/";

  /// GetX跨页面交互
  static const String getJumpOne = "/jumpOne";
  static const String getJumpTwo = "/jumpOne/jumpTwo";

  /// 别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => const Tabs()),
    GetPage(name: getJumpOne, page: () => GetJumpOnePage()),
    GetPage(name: getJumpTwo, page: () => GetJumpTwoPage()),
  ];
}
