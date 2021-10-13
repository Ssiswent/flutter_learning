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
        child: GetBuilder<CounterLogic>(
          // assignId: true,
          builder: (logic) {
            return Text(
              "点击了 ${logic.count} 次",
              style: const TextStyle(fontSize: 30),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add), //Change Icon
      ),
    );
  }
}
