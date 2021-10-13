import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetJumpOnePage extends StatelessWidget {
  GetJumpOnePage({Key? key}) : super(key: key);

  final logic = Get.put(GetJumpOneLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('跨页面-One'),
      ),
      body: Center(
        child: GetBuilder<GetJumpOneLogic>(builder: (logic) {
          return Text(
            "跨页面-Two点击了 ${logic.count} 次",
            style: const TextStyle(fontSize: 30),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.toJumpTwo(),
        child: const Icon(Icons.arrow_forward_outlined), //Change Icon
      ),
    );
  }
}
