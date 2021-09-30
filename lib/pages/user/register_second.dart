import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../tabs/tabs.dart';

class RegisterSecondPage extends StatelessWidget {
  const RegisterSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册第二步'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("这里是注册第二步"),
          ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Tabs(index: 2)),
                    (route) => false);
                Fluttertoast.showToast(
                    msg: "注册成功",
                    // toastLength: Toast.LENGTH_SHORT,
                    // gravity: ToastGravity.CENTER,
                    // timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: const Text("注册"))
        ],
      )),
    );
  }
}
