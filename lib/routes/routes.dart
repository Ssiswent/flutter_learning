import 'package:flutter_learning/pages/other/fun/staggered_grid_view/staggered_grid_view_binding.dart';
import 'package:flutter_learning/pages/other/fun/staggered_grid_view/staggered_grid_view_view.dart';
import 'package:flutter_learning/pages/other/get_bindings/get_bindings_binding.dart';
import 'package:flutter_learning/pages/other/get_bindings/get_bindings_view.dart';
import 'package:flutter_learning/pages/other/get_counter/view.dart';
import 'package:flutter_learning/pages/other/get_jump/get_jump_one/view.dart';
import 'package:flutter_learning/pages/other/get_jump/get_jump_two/view.dart';
import 'package:flutter_learning/pages/tabs/persistent_tabs/persistent_tabs_binding.dart';
import 'package:flutter_learning/pages/tabs/persistent_tabs/persistent_tabs_view.dart';
import 'package:flutter_learning/pages/tabs/tabs.dart';
import 'package:get/get.dart';

class RouteConfig {
  /// 主页面
  static const String main = "/";

  static const String getCounter = "/counter/:user";
  static const String getJumpOne = "/jumpOne";
  static const String getJumpTwo = "/jumpOne/jumpTwo";
  static const String getBindings = "/bindings";

  static const String staggeredGridView = "/staggeredGridView";

  /// 别名映射页面
  static final List<GetPage> getPages = [
    // GetPage(name: main, page: () => const Tabs()),
    GetPage(
      name: main,
      page: () => const PersistentTabsPage(),
      binding: PersistentTabsBinding(),
    ),
    GetPage(name: getCounter, page: () => GetCounterPage()),
    GetPage(name: getJumpOne, page: () => GetJumpOnePage()),
    GetPage(name: getJumpTwo, page: () => GetJumpTwoPage()),
    GetPage(
      name: getBindings,
      page: () => const GetBindingsPage(),
      binding: GetBindingsBinding(),
    ),
    GetPage(
      name: staggeredGridView,
      page: () => StaggeredGridViewPage(),
      binding: StaggeredGridViewBinding(),
    ),
  ];
}
