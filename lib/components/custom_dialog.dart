import 'dart:async';

import 'package:flutter/material.dart';

class CustomDialog extends Dialog {
  final String title;
  final String content;

  const CustomDialog(this.title, this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _showTimer(context);

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 15,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14))),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(title),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: const Icon(Icons.close),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  // 使用SizedBox并设置宽度是为了让文本从左开始显示
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    content,
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showTimer(context) {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pop(context);
      timer.cancel();
    });
  }
}
