import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_learning/api/rest_client.dart';

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
            ElevatedButton(
                onPressed: _getDioData, child: const Text("Get请求数据")),
            ElevatedButton(
                onPressed: _postDioData, child: const Text("Post提交数据")),
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

  void _getDioData() {
    final dio = Dio();
    // dio.options.headers["Demo-Header"] = "demo header";
    final client = RestClient(dio);
    client.getExample().then((response) {
      if (response.msg != null) {
        setState(() {
          msg = response.msg!;
        });
      }
    });
  }

  void _postData() async {
    var url = Uri.parse("https://jd.itying.com/api/httpPost");
    var response = await http.post(url, body: {"userName": "张三", "age": "18"});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void _postDioData() {
    final dio = Dio();
    // dio.options.headers["Demo-Header"] = "demo header";
    final client = RestClient(dio);
    client.postExample("1", "2").then((response) {
      print("msg:$response");
    });
  }
}
