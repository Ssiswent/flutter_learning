import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class NetworkRequstPage extends StatefulWidget {
  const NetworkRequstPage({Key? key}) : super(key: key);

  @override
  _NetworkRequstPageState createState() => _NetworkRequstPageState();
}

class _NetworkRequstPageState extends State<NetworkRequstPage> {
  String msg = "暂无数据";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络请求'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(msg),
            ElevatedButton(onPressed: _getData, child: const Text("Get请求数据")),
            ElevatedButton(onPressed: _postData, child: const Text("Post提交数据")),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/productList"),
                child: const Text("Get提交数据并渲染页面")),
          ],
        ),
      ),
    );
  }

  void _getData() async {
    var url = Uri.parse("https://jd.itying.com/api/httpGet");
    var response = await http.get(url);
    setState(() {
      msg = json.decode(response.body)["msg"];
    });
  }

  void _postData() async {
    var url = Uri.parse("https://jd.itying.com/api/httpPost");
    var response = await http.post(url, body: {"userName": "张三", "age": "18"});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
