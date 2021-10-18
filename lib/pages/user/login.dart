import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录页'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("这里是登录页"),
          ElevatedButton(
              onPressed: () {
                Get.back();
                Fluttertoast.showToast(
                    msg: "登录成功",
                    // toastLength: Toast.LENGTH_SHORT,
                    // gravity: ToastGravity.CENTER,
                    // timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: const Text("登录"))
        ],
      )),
    );
  }
}
