import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/other/date_picker.dart';
import 'package:flutter_learning/pages/other/dialog.dart';
import 'package:flutter_learning/pages/other/form.dart';
import 'package:flutter_learning/pages/other/get_counter/view.dart';
import 'package:flutter_learning/pages/other/get_state_counter/view.dart';
import 'package:flutter_learning/pages/other/get_store.dart';
import 'package:flutter_learning/pages/other/network_request.dart';
import 'package:flutter_learning/pages/other/product.dart';
import 'package:flutter_learning/pages/other/search.dart';
import 'package:flutter_learning/pages/other/swiper.dart';
import 'package:flutter_learning/routes/routes.dart';
import 'package:get/get.dart';

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
              Get.to(() => const SearchPage());
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
          onTap: () => Get.to(() => const ProductPage(arguments: {"pid": 456})),
        ),
        const Divider(),
        ListTile(
            contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: const Text("跳转到表单页并传值"),
            onTap: () => Get.to(() => const FormPage(
                  arguments: {"id": 123},
                ))),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到日期页"),
          onTap: () => Get.to(() => const DatePickerPage()),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到轮播图页"),
          onTap: () => Get.to(() => const SwiperPage()),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到Dialog页"),
          onTap: () => Get.to(() => const DialogPage()),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到网络请求页"),
          onTap: () => Get.to(() => const NetworkRequestPage()),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到简单存储页"),
          onTap: () => Get.to(() => const GetStorePage()),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到GetX简单计数器页"),
          onTap: () => Get.to(() => GetCounterPage()),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到GetX跨页面交互页"),
          onTap: () => Get.toNamed(RouteConfig.getJumpOne),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text("跳转到GetX包含State范例页"),
          onTap: () => Get.to(() => GetStateCounterPage()),
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
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)))),
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
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
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
            leading: CircleAvatar(backgroundImage: AssetImage("images/img1.jpeg")),
            title: Text("标题"),
            subtitle: Text("详情"),
          )
        ],
      ),
    );
  }
}
