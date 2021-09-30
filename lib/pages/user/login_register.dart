import 'package:flutter/material.dart';

class LoginAndRegisterPage extends StatelessWidget {
  const LoginAndRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/login"),
            child: const Text("跳转到登录页")),
        const SizedBox(height: 40),
        ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/register_first"),
            child: const Text("跳转到注册页"))
      ]),
    );
  }
}
