import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/other/get_jump/get_jump_one/logic.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetJumpTwoPage extends StatelessWidget {
  GetJumpTwoPage({Key? key}) : super(key: key);

  final oneLogic = Get.find<GetJumpOneLogic>();
  final twoLogic = Get.put(GetJumpTwoLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('跨页面-Two'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<GetJumpTwoLogic>(
              builder: (logic) {
                return Text(
                  '跨页面-Two点击了 ${twoLogic.count} 次',
                  style: const TextStyle(fontSize: 30.0),
                );
              },
            ),
            GetBuilder<GetJumpTwoLogic>(
              builder: (logic) {
                return Text(
                  '传递的数据：${twoLogic.msg}',
                  style: const TextStyle(fontSize: 30.0),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          oneLogic.increase();
          twoLogic.increase();
        },
        child: const Icon(Icons.add), //Change Icon
      ),
    );
  }
}
