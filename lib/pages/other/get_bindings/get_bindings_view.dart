import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_bindings_controller.dart';

class GetBindingsPage extends GetView<GetBindingsController> {
  const GetBindingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX-Bindings'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<GetBindingsController>(
              builder: (logic) {
                return Text(
                  "点击了 ${controller.count} 次",
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(result: {"count": controller.count}),
              child: const Text("返回并回传数据"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increase(),
        child: const Icon(Icons.add), //Change Icon
      ),
    );
  }
}
