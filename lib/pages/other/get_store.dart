import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';

class GetStorePage extends StatelessWidget {
  const GetStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetStore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _saveData, child: const Text("存储")),
            ElevatedButton(onPressed: _readData, child: const Text("读取")),
          ],
        ),
      ),
    );
  }

  _saveData() {
    // GetStorage box = GetStorage();
    // box.write('quote', 'GetX is the best');
  }

  _readData() {
    // GetStorage box = GetStorage();
    // debugPrint(box.read('quote'));
// out: GetX is the best
  }
}
