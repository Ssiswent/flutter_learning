import 'package:flutter/material.dart';
import 'package:flutter_learning/custom/round_underline_tab_indicator.dart';
import 'package:flutter_learning/pages/other/grid_view.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // title: const Text('分类'),
          // bottom: const TabBar(
          //   indicator: RoundUnderlineTabIndicator(
          //     indicatorWidth: 40,
          //     borderSide: BorderSide(
          //       width: 3.5,
          //       color: Colors.white,
          //     ),
          //   ),
          //   tabs: [Tab(text: "热门"), Tab(text: "推荐")],
          // ),
          // backgroundColor: Colors.cyan,
          title: const TabBar(
            indicator: RoundUnderlineTabIndicator(
              indicatorWidth: 40,
              borderSide: BorderSide(
                width: 3.5,
                color: Colors.white,
              ),
            ),
            tabs: [Tab(text: "GridView"), Tab(text: "推荐")],
          ),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    return TabBarView(
      children: [
        const GridViewPage(),
        ListView(
          children: const [
            ListTile(
              title: Text("推荐"),
            )
          ],
        )
      ],
    );
  }
}
