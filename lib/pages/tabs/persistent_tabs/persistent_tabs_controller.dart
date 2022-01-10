import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../category.dart';
import '../home.dart';
import 'package:flutter/material.dart';

import '../settings.dart';

class PersistentTabsController extends GetxController {
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  late List<Widget> pageList;

  late List<PersistentBottomNavBarItem> navBarsItems;

  @override
  void onInit() {
    pageList = [
      // 回调
      HomePage(() {
        tabController.index = 2;
      }),
      const CategoryPage(),
      const SettingsPage()
    ];
    navBarsItems = [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "首页",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.category),
        title: "分类",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "设置",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
    ];
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
