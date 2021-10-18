import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  var theme = Themes.gray.obs;

  @override
  void onInit() {
    GetStorage box = GetStorage();
    var theme = box.read('Theme');
    if (theme != null) {
      this.theme(theme);
    }
    super.onInit();
  }

  changeTheme(String theme) {
    this.theme(theme);
    GetStorage box = GetStorage();
    box.write('Theme', theme);
  }
}

class Themes {
  static const String gray = "gray";
  static const String blue = "blue";
  static const String cyan = "cyan";
  static const String deepPurple = "deepPurple";
  static const String deepOrange = "deepOrange";
  static const String green = "green";
  static const String indigo = "indigo";
  static const String orange = "orange";
  static const String purple = "purple";
  static const String pink = "pink";
  static const String red = "red";
  static const String teal = "teal";

  static const Map<String, MaterialColor> colors = {
    gray: Colors.grey,
    blue: Colors.blue,
    cyan: Colors.cyan,
    deepPurple: Colors.purple,
    deepOrange: Colors.orange,
    green: Colors.green,
    indigo: Colors.indigo,
    orange: Colors.orange,
    purple: Colors.purple,
    pink: Colors.pink,
    red: Colors.red,
    teal: Colors.teal,
  };
}
