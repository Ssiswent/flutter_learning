import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  Map? arguments;
  FormPage({Key? key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("表单页"),
      ),
      body: Text("id为${arguments != null ? arguments!["id"] : "0"}"),
      floatingActionButton: FloatingActionButton(
        child: const Text("返回"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
