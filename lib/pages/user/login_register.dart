import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/user/login.dart';
import 'package:flutter_learning/pages/user/register_first.dart';
import 'package:get/get.dart';

class LoginAndRegisterPage extends StatelessWidget {
  const LoginAndRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () => Get.to(() => const LoginPage()),
            child: const Text("跳转到登录页")),
        const SizedBox(height: 40),
        ElevatedButton(
            onPressed: () => Get.to(() => const RegisterFirsrPage()),
            child: const Text("跳转到注册页"))
      ]),
    );
  }
}
