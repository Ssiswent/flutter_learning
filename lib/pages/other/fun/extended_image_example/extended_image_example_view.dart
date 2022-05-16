import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'extended_image_example_controller.dart';
import 'package:flutter_learning/utils/widget_util.dart';

class ExtendedImageExamplePage extends GetView<ExtendedImageExampleController> {
  const ExtendedImageExamplePage({Key? key}) : super(key: key);

  final String imgUrl =
      "https://github.com/Ssiswent/flutter_learning/blob/master/images/3.0x/avatar.png?raw=true";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ExtendedImage"),
      ),
      body: GetBuilder<ExtendedImageExampleController>(
        builder: (_) {
          return ListView(
            children: [
              ExtendedImage.network(
                imgUrl,
                // width: 600,
                // height: 400,
                fit: BoxFit.fill,
                cache: true,
                loadStateChanged: (ExtendedImageState state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.loading:
                      controller.animationController.reset();
                      return Image.asset(
                        "assets/loading.gif",
                        fit: BoxFit.fill,
                      );

                    ///if you don't want override completed widget
                    ///please return null or state.completedWidget
                    //return null;
                    //return state.completedWidget;
                    case LoadState.completed:
                      controller.animationController.forward();
                      return FadeTransition(
                        opacity: controller.animationController,
                        child: ExtendedRawImage(
                          image: state.extendedImageInfo?.image,
                          // width: 600,
                          // height: 400,
                        ),
                      );
                    case LoadState.failed:
                      controller.animationController.reset();
                      return GestureDetector(
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.asset(
                              "assets/failed.jpg",
                              fit: BoxFit.fill,
                            ),
                            const Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Text(
                                "load image failed, click to reload",
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          state.reLoadImage();
                        },
                      );
                  }
                },
              ).prop(margins: [16], borderRadius: [8]),
              ExtendedImage.network(
                imgUrl,
                fit: BoxFit.contain,
                //enableLoadState: false,
                mode: ExtendedImageMode.gesture,
                initGestureConfigHandler: (state) {
                  return GestureConfig(
                    minScale: 0.9,
                    animationMinScale: 0.7,
                    maxScale: 3.0,
                    animationMaxScale: 3.5,
                    speed: 1.0,
                    inertialSpeed: 100.0,
                    initialScale: 1.0,
                    inPageView: false,
                    initialAlignment: InitialAlignment.center,
                  );
                },
                onDoubleTap: controller.onDoubleTap,
              )
            ],
          );
        },
      ),
    );
  }
}
