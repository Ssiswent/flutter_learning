import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('搜索页'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 10,
            children: const [
              MyButton(title: "第一集"),
              MyButton(title: "第一集第二部分"),
              MyButton(title: "第二集"),
              MyButton(title: "第三集10分钟"),
              MyButton(title: "第四集10~20分钟"),
              MyButton(title: "第五集"),
              MyButton(title: "第六集"),
            ],
          ),
        ));
  }
}

class MyButton extends StatelessWidget {
  final String title;
  const MyButton({Key? key, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: null, child: Text(title));
  }
}
