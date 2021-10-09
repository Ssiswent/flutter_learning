import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

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

    _getData();
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
}
