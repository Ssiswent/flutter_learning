import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final Map? arguments;
  const ProductPage({Key? key, this.arguments}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品详情页'),
      ),
      body: Text(
          "pid为${widget.arguments != null ? widget.arguments!["pid"] : "0"}"),
    );
  }
}
