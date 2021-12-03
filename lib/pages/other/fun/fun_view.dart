import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'fun_controller.dart';

class FunPage extends StatelessWidget {
  FunPage({Key? key}) : super(key: key);

  final controller = Get.put(FunController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: const Text("StaggeredGridView"),
              onTap: controller.toStaggeredGridViewPage,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
