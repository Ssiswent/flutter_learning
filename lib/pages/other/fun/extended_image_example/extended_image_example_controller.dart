import 'package:extended_image/extended_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

typedef DoubleClickAnimationListener = void Function();

class ExtendedImageExampleController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late AnimationController doubleClickAnimationController;
  late DoubleClickAnimationListener doubleClickAnimationListener;
  List<double> doubleTapScales = <double>[1.0, 2.0];

  Animation<double>? doubleClickAnimation;

  @override
  void onInit() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        lowerBound: 0.0,
        upperBound: 1.0);
    doubleClickAnimationController = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    animationController.dispose();
    doubleClickAnimationController.dispose();
  }

  onDoubleTap(ExtendedImageGestureState state) {
    ///you can use define pointerDownPosition as you can,
    ///default value is double tap pointer down postion.
    final Offset? pointerDownPosition = state.pointerDownPosition;
    final double? begin = state.gestureDetails!.totalScale;
    double end;

    //remove old
    doubleClickAnimation?.removeListener(doubleClickAnimationListener);

    //stop pre
    doubleClickAnimationController.stop();

    //reset to use
    doubleClickAnimationController.reset();

    if (begin == doubleTapScales[0]) {
      end = doubleTapScales[1];
    } else {
      end = doubleTapScales[0];
    }

    doubleClickAnimationListener = () {
      //print(_animation.value);
      state.handleDoubleTap(
          scale: doubleClickAnimation!.value,
          doubleTapPosition: pointerDownPosition);
    };
    doubleClickAnimation = doubleClickAnimationController
        .drive(Tween<double>(begin: begin, end: end));

    doubleClickAnimation!.addListener(doubleClickAnimationListener);

    doubleClickAnimationController.forward();
  }
}
