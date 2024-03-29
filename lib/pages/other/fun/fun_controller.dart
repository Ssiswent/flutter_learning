import 'package:flutter_learning/pages/other/fun/expandable_page.dart';
import 'package:flutter_learning/pages/other/fun/flutter/index.dart';
import 'package:flutter_learning/pages/other/fun/flutter_inner_drawer.dart';
import 'package:flutter_learning/routes/routes.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'lottie_view.dart';
import 'material_floating_search_bar_view.dart';

class FunController extends GetxController {
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

  toFlutterSlidablePage() {
    Get.toNamed(RouteConfig.flutterSlidablePage);
  }

  toImplicitlyAnimatedReorderableList() {
    Get.toNamed(RouteConfig.implicitlyAnimatedReorderableList);
  }

  toSignatureExample() {
    Get.toNamed(RouteConfig.signatureExample);
  }

  toRatingBar() {
    Get.toNamed(RouteConfig.ratingBar);
  }

  toPercentIndicator() {
    Get.toNamed(RouteConfig.percentIndicator);
  }

  toSyncfusionDatepicker() {
    Get.toNamed(RouteConfig.syncfusionDatepicker);
  }

  toSliderButton() {
    Get.toNamed(RouteConfig.sliderButton);
  }

  toMySliderList() {
    Get.toNamed(RouteConfig.mySliderList);
  }

  toAudioService() {
    Get.toNamed(RouteConfig.audioService);
  }

  toExtendedImage() {
    Get.toNamed(RouteConfig.extendedImage);
  }

  toFocusPage() {
    Get.toNamed(RouteConfig.focus);
  }

  toFlutterPage() {
    Get.to(() => const FlutterPage());
  }
}
