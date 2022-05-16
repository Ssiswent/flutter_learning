import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/other/fun/audio_services/audio_player_handler.dart';
import 'package:flutter_learning/routes/routes.dart';
import 'package:flutter_learning/theme/themes.dart';
import 'package:flutter_learning/utils/extensions.dart';
import 'package:flutter_learning/utils/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

// main() => runApp(const MyApp());
main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyAppController extends GetxController {
  var darkMode = 0.obs;
  late AudioPlayerHandler audioHandler;

  @override
  void onInit() async {
    audioHandler = await AudioService.init(
      builder: () => AudioPlayerHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.ryanheise.myapp.channel.audio',
        androidNotificationChannelName: 'Audio playback',
        androidNotificationOngoing: true,
      ),
    );
    GetStorage box = GetStorage();
    var darkMode = box.read('DarkMode');
    if (darkMode != null) {
      this.darkMode(darkMode);
    }
    super.onInit();
  }

  changeDarkMode(int darkMode) {
    this.darkMode(darkMode);
    GetStorage box = GetStorage();
    box.write('DarkMode', darkMode);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyAppController myAppController = Get.put(MyAppController());
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() => myAppController.darkMode.value == 2
        ? systemDarkModeApp(themeController)
        : userDarkModeApp(myAppController, themeController));
  }

  GetMaterialApp systemDarkModeApp(ThemeController themeController) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      initialRoute: RouteConfig.main,
      getPages: RouteConfig.getPages,
      defaultTransition: Transition.cupertino,
      // routingCallback: (route) {
      //   if (route != null) {
      //     debugPrint("routingCallback: " + route.current);
      //   }
      // },
      title: 'Material App',
      translations: MyTranslations(),
      locale: const Locale('zh'),
      // locale: window.locale,
      builder: (context, child) => Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            hideKeyboard(context);
          },
          child: child,
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Themes.colors[themeController.theme.value],
        highlightColor: ColorUtil.fromHex("#55FD6D50"),
        // splashColor: ColorUtil.fromHex("#55FD6D50"),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Themes.colors[themeController.theme.value],
        highlightColor: ColorUtil.fromHex("#55FD6D50"),
        // splashColor: ColorUtil.fromHex("#55FD6D50"),
      ),
      // 配置语言
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        // Locale('en', 'US'),
      ],
    );
  }

  GetMaterialApp userDarkModeApp(
      MyAppController myAppController, ThemeController themeController) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      initialRoute: RouteConfig.main,
      getPages: RouteConfig.getPages,
      defaultTransition: Transition.rightToLeft,
      title: 'Material App',
      translations: MyTranslations(),
      locale: const Locale('zh'),
      // locale: window.locale,
      builder: (context, child) => Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            hideKeyboard(context);
          },
          child: child,
        ),
      ),
      theme: myAppController.darkMode.value == 1
          ? ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Themes.colors[themeController.theme.value],
              highlightColor: ColorUtil.fromHex("#55FD6D50"),
              // splashColor: ColorUtil.fromHex("#55FD6D50"),
            )
          : ThemeData(
              brightness: Brightness.light,
              primarySwatch: Themes.colors[themeController.theme.value],
              highlightColor: ColorUtil.fromHex("#55FD6D50"),
              // splashColor: ColorUtil.fromHex("#55FD6D50"),
            ),
      // 配置语言
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        // Locale('en', 'US'),
      ],
    );
  }
}

hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
