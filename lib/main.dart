import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/tabs/tabs.dart';
import 'package:flutter_learning/routes/routes.dart';
import 'package:flutter_learning/utils/extensions.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

// main() => runApp(const MyApp());
main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      initialRoute: RouteConfig.main,
      getPages: RouteConfig.getPages,
      title: 'Material App',
      home: const Tabs(),
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
        primarySwatch: Colors.red,
        highlightColor: ColorUtil.fromHex("#55FD6D50"),
        // splashColor: ColorUtil.fromHex("#55FD6D50"),
      ),
      // 配置语言
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
    );
  }
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
