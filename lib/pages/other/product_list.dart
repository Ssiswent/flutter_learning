import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_learning/api/rest_client.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List list = [];

  @override
  void initState() {
    super.initState();

    // _getData();
    _getDioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品列表'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index]["title"]),
          );
        },
      ),
    );
  }

  void _getData() async {
    var url = Uri.parse("https://jd.itying.com/api/pcate");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        list = json.decode(response.body)["result"];
      });
    }
  }

  void _getDioData() {
    final logger = Logger();
    // Provide a dio instance
    final dio = Dio();
    // config your dio headers globally
    // dio.options.headers["Demo-Header"] = "demo header";
    final client = RestClient(dio);

    client.getProducts().then((result) {
      logger.i(result);
      setState(() {
        list = json.decode(result)["result"];
      });
    });
  }
}
