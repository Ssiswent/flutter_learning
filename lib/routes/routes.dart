import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/drawer/user.dart';
import 'package:flutter_learning/pages/other/date_picker.dart';

import 'package:flutter_learning/pages/other/form.dart';
import 'package:flutter_learning/pages/other/product.dart';
import 'package:flutter_learning/pages/other/search.dart';
import 'package:flutter_learning/pages/other/swiper.dart';
import 'package:flutter_learning/pages/tabs/tabs.dart';
import 'package:flutter_learning/pages/user/login.dart';
import 'package:flutter_learning/pages/user/register_first.dart';
import 'package:flutter_learning/pages/user/register_second.dart';

// 配置路由
// final Map<String, Function> routes
final routes = {
  "/": (context) => const Tabs(),
  "/form": (context, {arguments}) => FormPage(arguments: arguments),
  "/search": (context) => const SearchPage(),
  "/product": (context, {arguments}) => ProductPage(arguments: arguments),
  "/login": (context) => const LoginPage(),
  "/register_first": (context) => const RegisterFirsrPage(),
  "/register_second": (context) => const RegisterSecondPage(),
  "/user": (context) => const UserPage(),
  "/date": (context) => const DatePickerPage(),
  "/swiper": (context) => const SwiperPage(),
};

// 固定写法
// ignore: prefer_function_declarations_over_variables
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
