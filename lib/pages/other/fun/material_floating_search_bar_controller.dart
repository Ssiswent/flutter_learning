import 'package:flutter_learning/pages/other/fun/material_floating_search_bar_view.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class FloatingSearchBarGetController extends GetxController {
  final searchController = FloatingSearchBarController();
  final searchController1 = FloatingSearchBarController();

  final _names = [
    "Amy",
    "August",
    "Ben",
    "Bruce",
    "Cindy",
    "Daniel",
    "Erik",
    "Emma",
    "Frank",
    "Fred",
    "Ghost",
    "Halsy",
    "Henry",
    "Ivy",
    "Judy",
    "Jay",
    "Khan",
    "Leo",
    "Max",
    "Nancy",
  ];

  var nowName = "";

  var newNames = [];

  @override
  void onInit() {
    newNames = _names;
    super.onInit();
  }

  void onQueryChanged(String query) {
    var lowerQ = query.toLowerCase();
    newNames =
        _names.where((name) => name.toLowerCase().contains(lowerQ)).toList();
    update();
  }

  clickOnItems({required String name}) {
    searchController.close();
    searchController1.close();
    nowName = name;
    update();
  }

  toFloatingSearchAppBarExample() {
    Get.to(() => FloatingSearchAppBarExample());
  }
}
