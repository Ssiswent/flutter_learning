import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'animations_controller.dart';

class AnimationsPage extends StatelessWidget {
  AnimationsPage({Key? key}) : super(key: key);

  final controller = Get.put(AnimationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: const Text("Hero动画"),
              onTap: controller.toHeroAnimationsPage,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
