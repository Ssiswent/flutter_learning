import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_learning/api/rest_client.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> list = [];

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
            title: Text(list[index].title != null ? list[index].title! : ""),
          );
        },
      ),
    );
  }

  // ignore: unused_element
  _getData() async {
    var url = Uri.parse("https://jd.itying.com/api/pcate");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        list = json.decode(response.body)["result"];
      });
    }
  }

  _getDioData() {
    final dio = Dio();
    // dio.options.headers["Demo-Header"] = "demo header";
    final client = RestClient(dio);
    client.getProducts().then((response) {
      if (response.result != null) {
        setState(() {
          list = response.result!;
        });
      }
    });
  }
}
