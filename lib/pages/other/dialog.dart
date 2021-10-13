import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_learning/components/custom_dialog.dart';
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
            ),
            const Divider(height: 40),
            const Text("自定义Dialog"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomDialog("关于我们", "内容");
                    });
              },
              child: const Text('关于我们'),
            ),
            const Divider(height: 40),
            const Text("Get--Dialog"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showGetSnackbar,
              child: const Text('Snackbar'),
            ),
            ElevatedButton(
              onPressed: _showGetDialog,
              child: const Text('DefaultDialog'),
            ),
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
                  // print("1");
                  Get.back();
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text("选项2"),
                onPressed: () {
                  // print("2");
                  Get.back();
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text("选项3"),
                onPressed: () {
                  // print("3");
                  Get.back();
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
          return SizedBox(
            height: 240,
            child: Column(
              children: [
                ListTile(
                  title: const Text("分享A"),
                  onTap: () {
                    // print("分享A");
                    Get.back();
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("分享B"),
                  onTap: () {
                    // print("分享B");
                    Get.back();
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("分享C"),
                  onTap: () {
                    // print("分享C");
                    Get.back();
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

  _showGetSnackbar() {
    Get.snackbar(
      "Hi", "message",
      // colorText: Colors.blue,
      // snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.ac_unit, color: Colors.white),
      titleText: const Text(
        "Title",
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
      messageText: const Text(
        "Message",
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      borderRadius: 24,
      // snackStyle: SnackStyle.GROUNDED,
      // backgroundColor: Colors.cyan,
      // borderWidth: 2,
      // borderColor: Colors.red,
      // backgroundGradient: const LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [Colors.black, Colors.yellow]),
    );
  }

  _showGetDialog() {
    Get.defaultDialog(
      title: "title",
      // middleText: "middleText",
      // titlePadding: const EdgeInsets.all(10),
      // titleStyle: const TextStyle(fontSize: 20, color: Colors.cyan),
      content: Container(
        // 使用SizedBox并设置宽度是为了让文本从左开始显示
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: const Text(
          "content",
          // style: TextStyle(fontSize: 20, color: Colors.cyan),
        ),
      ),
      // textConfirm: "Confirm",
      // textCancel: "Cancel",
      // cancelTextColor: Colors.blue,
      // confirmTextColor: Colors.white,
      // 实现了自定义的控件后，将无效，onCancel不要实现Get.back()方法，已经自带了
      // onCancel: () => Get.back(),
      onConfirm: () => Get.back(),
      cancel: SizedBox(
        width: 120,
        child: Row(
          children: [
            Expanded(
                child: OutlinedButton(
              onPressed: () => Get.back(),
              child: const Text("cancel"),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                side: const BorderSide(width: 2, color: Colors.red),
              ),
            )),
            const SizedBox(width: 20),
          ],
        ),
      ),
      confirm: SizedBox(
        width: 120,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
                child: ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("confirm"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              )),
            )),
          ],
        ),
      ),
      // backgroundColor: Colors.cyan,
      // 点击外部是否消失
      // barrierDismissible: false,
      // buttonColor: Colors.cyan,
      radius: 24,
    );
  }
}
