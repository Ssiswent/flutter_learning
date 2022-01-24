import 'package:get/get.dart';

class FlutterSlidableController extends GetxController {
  List<String> dataArray = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
  ];

  bool has1 = true;
  bool has2 = true;
  bool has3 = true;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  decrement({required int index}) {
    dataArray.removeAt(index);
    update();
  }

  delete1() {
    has1 = false;
    update();
  }

  delete2() {
    has2 = false;
    update();
  }

  delete3() {
    has3 = false;
    update();
  }
}
