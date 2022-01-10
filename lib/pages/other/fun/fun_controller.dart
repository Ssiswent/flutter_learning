import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/other/fun/expandable_page.dart';
import 'package:flutter_learning/pages/other/fun/flutter_inner_drawer.dart';
import 'package:flutter_learning/routes/routes.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'lottie_view.dart';
import 'material_floating_search_bar_view.dart';

class FunController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  toStaggeredGridViewPage() {
    Get.toNamed(RouteConfig.staggeredGridView);
  }

  toExpandablePage() {
    Get.to(() => const MyHomePage());
  }

  toInnerDrawerPage() {
    Get.to(() => FlutterInnerDrawer());
  }

  toFloatingSearchBarPage(context) {
    // Get.to(() => FloatingSearchBarPage());
    pushNewScreen(
      context,
      screen: FloatingSearchBarPage(),
      withNavBar: true,
      // pageTransitionAnimation: PageTransitionAnimation.slideUp,
    );
  }

  toLottiePage() {
    Get.to(() => LottiePage());
  }
}

class AnimationController1 extends GetxController
    with SingleGetTickerProviderMixin {
  late Animation animation;
  late AnimationController _animationController;

  @override
  void onInit() {
    super.onInit();

    _animationController = AnimationController(vsync: this);
    _animationController.repeat(reverse: true);

    animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() => update());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    _animationController.dispose();
  }
}
