import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/other/fun/lottie_controller.dart';
import 'package:flutter_learning/utils/widget_util.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatelessWidget {
  LottiePage({Key? key}) : super(key: key);

  final controller = Get.put(LottieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LottiePage'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: GetBuilder<LottieController>(
          builder: (_) {
            return Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  "assets/lottie_1.json",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ).prop(margins: [16, 16, 16, 0]),
                Lottie.network(
                  "https://assets9.lottiefiles.com/private_files/lf30_pbxec3cw.json",
                  controller: controller.animationController,
                  // repeat: false,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    controller.animationController
                      ..duration = composition.duration
                      ..forward();
                    // controller.animationController.value = 0.5;
                  },
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ).prop(margins: [16, 16, 16, 0]),
              ],
            );
          },
        ),
      ),
    );
  }
}
