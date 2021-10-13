import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/user/register_second.dart';
import 'package:get/get.dart';

class RegisterFirsrPage extends StatelessWidget {
  const RegisterFirsrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册第一步'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("这里是注册第一步"),
          ElevatedButton(
              onPressed: () => Get.to(() => const RegisterSecondPage()),
              // Get.off(const RegisterSecondPage()),
              child: const Text("下一步"))
        ],
      )),
    );
  }
}
