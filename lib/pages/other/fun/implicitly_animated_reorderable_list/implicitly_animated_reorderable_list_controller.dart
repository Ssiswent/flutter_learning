import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImplicitlyAnimatedReorderableListController extends GetxController {
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

  bool inReorder = false;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  onReorderStarted() {
    inReorder = true;
    update();
  }

  onReorderFinished(List<String> newItems) {
    scrollController.jumpTo(scrollController.offset);
    inReorder = false;
    dataArray
      ..clear()
      ..addAll(newItems);

    update();
  }

  deleteItem({required String lang}) {
    dataArray.remove(lang);
    update();
  }

  addItem() {
    // final result = await Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const LanguageSearchPage(),
    //       ),
    //     );

    //     if (result != null && !selectedLanguages.contains(result)) {
    //       setState(() {
    //         selectedLanguages.add(result);
    //       });
    //     }
  }
}
