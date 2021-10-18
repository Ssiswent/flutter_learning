import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetCounterPage extends StatelessWidget {
  GetCounterPage({Key? key}) : super(key: key);

  final logic = Get.put(CounterLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX计数器'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("来自命名路由的数据: ${Get.parameters["user"]}"),
            const SizedBox(height: 20),
            GetBuilder<CounterLogic>(
              // assignId: true,
              // 局部更新
              id: "count",
              builder: (logic) {
                return Text(
                  "点击了 ${logic.count} 次",
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            const SizedBox(height: 20),
            GetBuilder<CounterLogic>(
              // assignId: true,
              id: "count1",
              builder: (logic) {
                return Text(
                  "点击了 ${logic.count1} 次",
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                "点击了 ${logic.count2} 次",
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase2(),
        child: const Icon(Icons.add), //Change Icon
      ),
    );
  }
}
