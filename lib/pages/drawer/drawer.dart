import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/drawer/user.dart';
import 'package:flutter_learning/utils/extensions.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  final int index;
  // 回调
  final ValueSetter<int>? onCall;
  const MyDrawer(this.index, {this.onCall, Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/avatar.png")),
                  accountName: Text("Ssiswent"),
                  accountEmail: Text("liyugu971208@gmail.com"),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/img1.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // DrawerHeader(
                //   child: Text(
                //     "头部",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("images/img1.jpeg"),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
              child: Column(
                children: [
                  ListTile(
                    tileColor: _currentIndex == 0
                        ? ColorUtil.fromHex("#55FD6D50")
                        : ColorUtil.fromHex("#FAFAFA"),
                    contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: const CircleAvatar(child: Icon(Icons.home)),
                    title: const Text("我的空间"),
                    onTap: () {
                      Get.back();
                      setState(() {
                        _currentIndex = 0;
                        if (widget.onCall != null) {
                          widget.onCall!(_currentIndex);
                        }
                      });
                    },
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: const CircleAvatar(child: Icon(Icons.people)),
                    title: const Text("用户中心"),
                    onTap: () {
                      Get.back();
                      Get.to(() => const UserPage());
                    },
                  ),
                  ListTile(
                    tileColor: _currentIndex == 2
                        ? ColorUtil.fromHex("#55FD6D50")
                        : ColorUtil.fromHex("#FAFAFA"),
                    contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: const CircleAvatar(child: Icon(Icons.settings)),
                    title: const Text("设置中心"),
                    onTap: () {
                      Get.back();
                      setState(() {
                        _currentIndex = 2;
                        if (widget.onCall != null) {
                          widget.onCall!(_currentIndex);
                        }
                      });
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
