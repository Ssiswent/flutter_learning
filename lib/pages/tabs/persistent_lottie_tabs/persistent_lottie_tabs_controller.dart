import 'package:flutter_learning/utils/widget_util.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../category.dart';
import '../home.dart';
import 'package:flutter/material.dart';

import '../settings.dart';

class PersistentLottieTabsController extends GetxController
    with SingleGetTickerProviderMixin {
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;

  late List<Widget> pageList;

  late List<PersistentBottomNavBarItem> navBarsItems;

  @override
  void onInit() {
    animationController1 = AnimationController(vsync: this);
    animationController2 = AnimationController(vsync: this);
    animationController3 = AnimationController(vsync: this);
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
        icon: Lottie.asset(
          "assets/lottie_class.json",
          controller: animationController1,
          onLoaded: (composition) {
            animationController1
              ..duration = composition.duration
              ..forward();
          },
        ),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
        onPressed: (context) {
          animationController1.forward();
          animationController2.value = 0;
          animationController3.value = 0;
          tabController.index = 0;
        },
      ),
      PersistentBottomNavBarItem(
        icon: Lottie.asset(
          "assets/lottie_smile.json",
          controller: animationController2,
          onLoaded: (composition) {
            animationController2.duration = composition.duration;
          },
        ),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
        onPressed: (context) {
          animationController2.forward();
          animationController1.value = 0;
          animationController3.value = 0;
          tabController.index = 1;
        },
      ),
      PersistentBottomNavBarItem(
        icon: Lottie.asset(
          "assets/lottie_find.json",
          controller: animationController3,
          onLoaded: (composition) {
            animationController3.duration = composition.duration;
          },
        ),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
        onPressed: (context) {
          animationController3.forward();
          animationController1.value = 0;
          animationController2.value = 0;
          tabController.index = 2;
        },
      ),
    ];
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    animationController3.dispose();
    super.dispose();
  }

  tapFLB() {
    navBarsItems = [
      PersistentBottomNavBarItem(
        icon: Lottie.asset(
          "assets/lottie_ice.json",
          controller: animationController1,
          // repeat: false,
          onLoaded: (composition) {
            // Configure the AnimationController with the duration of the
            // Lottie file and start the animation.
            animationController1
              ..duration = composition.duration
              ..forward();
            // animationController.value = 0;
          },
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
        title: "首页",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
        onPressed: (context) {
          animationController1.forward();
          animationController2.value = 0;
        },
      ),
      PersistentBottomNavBarItem(
        icon: Lottie.asset(
          "assets/lottie_rice.json",
          controller: animationController2,
          onLoaded: (composition) {
            animationController2
              ..duration = composition.duration
              ..forward();
            // animationController2.value = 0;
          },
          width: 24,
          height: 24,
          fit: BoxFit.cover,
        ).prop(bgColor: Colors.red),
        title: "分类",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
        onPressed: (context) {
          animationController2.forward();
          animationController1.value = 0;
        },
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "设置",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
    ];
    update();
  }
}
