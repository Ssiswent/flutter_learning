import 'package:flutter_learning/pages/other/fun/flutter_slidable/flutter_slidable_binding.dart';
import 'package:flutter_learning/pages/other/fun/flutter_slidable/flutter_slidable_view.dart';
import 'package:flutter_learning/pages/other/fun/implicitly_animated_reorderable_list/implicitly_animated_reorderable_list_binding.dart';
import 'package:flutter_learning/pages/other/fun/implicitly_animated_reorderable_list/implicitly_animated_reorderable_list_view.dart';
import 'package:flutter_learning/pages/other/fun/percent_indicator/percent_indicator_binding.dart';
import 'package:flutter_learning/pages/other/fun/percent_indicator/percent_indicator_view.dart';
import 'package:flutter_learning/pages/other/fun/rating_bar/rating_bar_binding.dart';
import 'package:flutter_learning/pages/other/fun/rating_bar/rating_bar_view.dart';
import 'package:flutter_learning/pages/other/fun/signature_example/signature_example_binding.dart';
import 'package:flutter_learning/pages/other/fun/signature_example/signature_example_view.dart';
import 'package:flutter_learning/pages/other/fun/staggered_grid_view/staggered_grid_view_binding.dart';
import 'package:flutter_learning/pages/other/fun/staggered_grid_view/staggered_grid_view_view.dart';
import 'package:flutter_learning/pages/other/get_bindings/get_bindings_binding.dart';
import 'package:flutter_learning/pages/other/get_bindings/get_bindings_view.dart';
import 'package:flutter_learning/pages/other/get_counter/view.dart';
import 'package:flutter_learning/pages/other/get_jump/get_jump_one/view.dart';
import 'package:flutter_learning/pages/other/get_jump/get_jump_two/view.dart';
import 'package:flutter_learning/pages/tabs/persistent_lottie_tabs/persistent_lottie_tabs_binding.dart';
import 'package:flutter_learning/pages/tabs/persistent_lottie_tabs/persistent_lottie_tabs_view.dart';
import 'package:flutter_learning/pages/tabs/persistent_tabs/persistent_tabs_binding.dart';
import 'package:flutter_learning/pages/tabs/persistent_tabs/persistent_tabs_view.dart';
import 'package:flutter_learning/pages/tabs/tabs.dart';
import 'package:get/get.dart';

class RouteConfig {
  /// 主页面
  static const String main = "/";

  static const String getCounter = "/counter/:user";
  static const String getJumpOne = "/jumpOne";
  static const String getJumpTwo = "/jumpOne/jumpTwo";
  static const String getBindings = "/bindings";

  static const String staggeredGridView = "/staggeredGridView";
  static const String flutterSlidablePage = "/flutterSlidablePage";
  static const String implicitlyAnimatedReorderableList =
      "/implicitlyAnimatedReorderableList";
  static const String signatureExample = "/signatureExample";
  static const String ratingBar = "/ratingBar";
  static const String percentIndicator = "/percentIndicator";

  /// 别名映射页面
  static final List<GetPage> getPages = [
    // GetPage(name: main, page: () => const Tabs()),
    // GetPage(
    //   name: main,
    //   page: () => const PersistentTabsPage(),
    //   binding: PersistentTabsBinding(),
    // ),
    GetPage(
      name: main,
      page: () => const PersistentLottieTabsPage(),
      binding: PersistentLottieTabsBinding(),
    ),
    GetPage(name: getCounter, page: () => GetCounterPage()),
    GetPage(name: getJumpOne, page: () => GetJumpOnePage()),
    GetPage(name: getJumpTwo, page: () => GetJumpTwoPage()),
    GetPage(
      name: getBindings,
      page: () => const GetBindingsPage(),
      binding: GetBindingsBinding(),
    ),
    GetPage(
      name: staggeredGridView,
      page: () => const StaggeredGridViewPage(),
      binding: StaggeredGridViewBinding(),
    ),
    GetPage(
      name: flutterSlidablePage,
      page: () => const FlutterSlidablePage(),
      binding: FlutterSlidableBinding(),
    ),
    GetPage(
      name: implicitlyAnimatedReorderableList,
      page: () => const ImplicitlyAnimatedReorderableListPage(),
      binding: ImplicitlyAnimatedReorderableListBinding(),
    ),
    GetPage(
      name: signatureExample,
      page: () => const SignatureExamplePage(),
      binding: SignatureExampleBinding(),
    ),
    GetPage(
      name: ratingBar,
      page: () => const RatingBarPage(),
      binding: RatingBarBinding(),
    ),
    GetPage(
      name: percentIndicator,
      page: () => const PercentIndicatorPage(),
      binding: PercentIndicatorBinding(),
    ),
  ];
}
