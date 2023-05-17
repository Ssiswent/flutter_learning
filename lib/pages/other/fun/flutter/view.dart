import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FlutterPage extends GetView<FlutterController> {
  const FlutterPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FlutterPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlutterController>(
      init: FlutterController(),
      id: "flutter",
      builder: (_) {
        return Scaffold(
            appBar: AppBar(title: const Text("flutter")),
            body: SafeArea(
              child: _buildView(),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                controller.onTap();
              },
            ));
      },
    );
  }
}
