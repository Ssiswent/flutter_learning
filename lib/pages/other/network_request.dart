import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/api/rest_client.dart';
import 'package:flutter_learning/pages/other/product_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkRequestController extends GetxController {
  var msg = "暂无数据".obs;

  // ignore: unused_element
  _getData() async {
    var url = Uri.parse("https://jd.itying.com/api/httpGet");
    var response = await http.get(url);
    msg.value = json.decode(response.body)["msg"];
  }

  _getDioData() {
    final dio = Dio();
    // dio.options.headers["Demo-Header"] = "demo header";
    final client = RestClient(dio);
    client.getExample().then((response) {
      if (response.msg != null) {
        // msg.value = response.msg!;
        msg(response.msg!);
      }
    });
  }

  // ignore: unused_element
  _postData() async {
    var url = Uri.parse("https://jd.itying.com/api/httpPost");
    var response = await http.post(url, body: {"userName": "张三", "age": "18"});
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
  }

  _postDioData() {
    final dio = Dio();
    // dio.options.headers["Demo-Header"] = "demo header";
    final client = RestClient(dio);
    client.postExample("1", "2").then((response) {
      debugPrint("msg:$response");
    });
  }
}

class NetworkRequestPage extends StatelessWidget {
  const NetworkRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NetworkRequestController c = Get.put(NetworkRequestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络请求'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(c.msg.value),
            ),
            ElevatedButton(onPressed: c._getDioData, child: const Text("Get请求数据")),
            ElevatedButton(onPressed: c._postDioData, child: const Text("Post提交数据")),
            ElevatedButton(onPressed: () => Get.to(() => const ProductListPage()), child: const Text("Get提交数据并渲染页面")),
          ],
        ),
      ),
    );
  }
}
