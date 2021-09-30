import 'package:flutter/material.dart';
import 'package:flutter_learning/custom/round_underline_tab_indicator.dart';
import 'package:flutter_learning/pages/user/login_register.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

// 注意
class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print("TabController index: ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          // 注意
          controller: _tabController,
          indicator: const RoundUnderlineTabIndicator(
            indicatorWidth: 40,
            borderSide: BorderSide(
              width: 3.5,
              color: Colors.white,
            ),
          ),
          tabs: const [Tab(text: "登录注册"), Tab(text: "推荐")],
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return TabBarView(
      // 注意
      controller: _tabController,
      children: [
        const LoginAndRegisterPage(),
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
