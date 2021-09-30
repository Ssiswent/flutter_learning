import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage>
    with AutomaticKeepAliveClientMixin {
  // AutomaticKeepAliveClientMixin 防止切换tab重绘
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // AutomaticKeepAliveClientMixin
    super.build(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemCount: 10,
        itemBuilder: _getListData,
      ),
    );
  }
}

Widget _getListData(context, index) {
  return Container(
    child: Column(
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14)),
            image: DecorationImage(
                image: AssetImage("images/img1.jpeg"), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          ("第$index个"),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.cyan, width: 1),
      borderRadius: BorderRadius.circular(14),
    ),
  );
}
