import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/user/login.dart';
import 'package:flutter_learning/pages/user/register_first.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class LoginAndRegisterPage extends StatelessWidget {
  const LoginAndRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () => pushNewScreen(
                  context,
                  screen: const LoginPage(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.slideUp,
                ),
            child: const Text("跳转到登录页")),
        const SizedBox(height: 40),
        ElevatedButton(
            onPressed: () => Get.to(() => const RegisterFirsrPage()),
            child: const Text("跳转到注册页"))
      ]),
    );
  }
}
