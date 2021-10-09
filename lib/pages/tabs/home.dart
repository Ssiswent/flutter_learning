import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // 回调
  final VoidCallback onCall;
  const HomePage(this.onCall, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
        // backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, "/search");
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            // 回调
            onPressed: widget.onCall,
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: getListView(),
      ),
    );
  }

  Widget getListView() {
    return ListView(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到商品详情页并传值"),
          onTap: () =>
              Navigator.pushNamed(context, "/product", arguments: {"pid": 456}),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到表单页并传值"),
          onTap: () =>
              Navigator.pushNamed(context, "/form", arguments: {"id": 123}),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到日期页"),
          onTap: () => Navigator.pushNamed(context, "/date"),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到轮播图页"),
          onTap: () => Navigator.pushNamed(context, "/swiper"),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到Dialog页"),
          onTap: () => Navigator.pushNamed(context, "/dialog"),
        ),
        const Divider(),
        Column(
          children: list.map((e) => ListTile(title: e)).toList(),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ElevatedButton.icon(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)))),
            label: const Text("增加"),
            icon: const Icon(Icons.add_chart_outlined),
            onPressed: () {
              setState(() {
                list.add(getCard());
              });
            },
          ),
        )
      ],
    );
  }

  Widget getItem(String title, Function() didSelectedFunc) {
    return GestureDetector(
      child: ListTile(title: Text(title)),
      onTap: didSelectedFunc,
    );
  }

  Widget getCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 15,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 19 / 9,
            child: Image.asset(
              "images/img1.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          const ListTile(
            leading:
                CircleAvatar(backgroundImage: AssetImage("images/img1.jpeg")),
            title: Text("标题"),
            subtitle: Text("详情"),
          )
        ],
      ),
    );
  }
}
