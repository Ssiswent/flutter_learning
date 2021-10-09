import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showDialog,
              child: const Text('AlertDialog'),
            ),
            ElevatedButton(
              onPressed: _showSimpleDialog,
              child: const Text('SimpleDialog'),
            ),
            ElevatedButton(
              onPressed: _showModalBottomSheet,
              child: const Text('ModalBottomSheet'),
            ),
            ElevatedButton(
              onPressed: _showToast,
              child: const Text('Toast'),
            )
          ],
        ),
      ),
    );
  }

  // void _showDialog() async {
  //   var result = await showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text("标题"),
  //           content: const Text("内容"),
  //           actions: [
  //             TextButton(
  //                 onPressed: () => Navigator.pop(context, "Cancel"),
  //                 child: const Text("取消")),
  //             TextButton(
  //                 onPressed: () => Navigator.pop(context, "Ok"),
  //                 child: const Text("确定")),
  //           ],
  //         );
  //       });

  //   print(result);
  // }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("标题"),
            content: const Text("内容"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("取消")),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("确定")),
            ],
          );
        });
  }

  void _showSimpleDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("标题"),
            children: [
              SimpleDialogOption(
                child: const Text("选项1"),
                onPressed: () {
                  print("1");
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text("选项2"),
                onPressed: () {
                  print("2");
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text("选项3"),
                onPressed: () {
                  print("3");
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 240,
            child: Column(
              children: [
                ListTile(
                  title: const Text("分享A"),
                  onTap: () {
                    print("分享A");
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("分享B"),
                  onTap: () {
                    print("分享B");
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("分享C"),
                  onTap: () {
                    print("分享C");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  void _showToast() {
    Fluttertoast.showToast(
        msg: "Toast信息",
        toastLength: Toast.LENGTH_SHORT,
        // gravity: ToastGravity.CENTER,
        // timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
