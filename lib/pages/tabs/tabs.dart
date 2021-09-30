import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/drawer/drawer.dart';
import 'package:flutter_learning/utils/extensions.dart';

import 'home.dart';
import 'category.dart';
import 'settings.dart';

class Tabs extends StatefulWidget {
  final int index;
  const Tabs({Key? key, this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List<Widget> _pageList = [];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;

    _pageList = [
      // 回调
      HomePage(() {
        setState(() {
          _currentIndex = 2;
        });
      }),
      const CategoryPage(),
      const SettingsPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _pageList[_currentIndex],
      // 防止切换Tab重新加载
      body: IndexedStack(
        index: _currentIndex,
        children: _pageList,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          primarySwatch: Colors.red,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          selectedFontSize: 12,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
          ],
        ),
      ),

      drawer: MyDrawer(_currentIndex, onCall: (index) {
        setState(() {
          _currentIndex = index;
        });
      }),
      // 右侧侧边栏
      // endDrawer: const Drawer(
      //   child: Text("Drawer"),
      // ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentIndex = 1;
            });
          },
          child: const Icon(Icons.add),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28), color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
