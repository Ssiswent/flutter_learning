import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'audio_services_controller.dart';
import 'package:flutter_learning/utils/widget_util.dart';

class AudioServicesPage extends GetView<AudioServicesController> {
  const AudioServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AudioService"),
      ),
      body: GetBuilder<AudioServicesController>(
        builder: (_) {
          return ListView(
            children: [
              TextField(
                controller: controller.textController,
                decoration: const InputDecoration(
                  labelText: "播放内容",
                  border: OutlineInputBorder(),
                ),
              ).prop(margins: [16]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.play_circle_filled_rounded,
                    size: 60,
                  ).prop(onTap: controller.playSound),
                  const Icon(
                    Icons.stop_circle_outlined,
                    size: 60,
                  ).prop(onTap: controller.stopSound)
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
