import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetStateCounterPage extends StatelessWidget {
  GetStateCounterPage({Key? key}) : super(key: key);

  final logic = Get.put(GetStateCounterLogic());
  final state = Get.find<GetStateCounterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('计数器-State')),
      body: Center(
        child: GetBuilder<GetStateCounterLogic>(
          builder: (logic) {
            return Text(
              '点击了 ${state.count} 次',
              style: const TextStyle(fontSize: 30.0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
