import 'package:flutter_learning/main.dart';
import 'package:flutter_learning/theme/themes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GetOtherFuncPage extends StatelessWidget {
  GetOtherFuncPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  // final lightOrDark =
  //     Get.isDarkMode ? "Switch Light Theme".tr.obs : "Switch Dark Theme".tr.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX的其他功能'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => switchLocale1(),
              child: Text("Switch Locale".tr),
            ),
            const Divider(height: 40),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email".tr,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (GetUtils.isEmail(emailController.text)) {
                  Get.snackbar(
                    "Validate Successful".tr,
                    "Correct Email Format".tr,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    duration: const Duration(milliseconds: 1200),
                  );
                } else {
                  Get.snackbar(
                    "Validate Failed".tr,
                    "Wrong Email Format".tr,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    duration: const Duration(milliseconds: 1200),
                  );
                }
              },
              child: Text("Validate Email".tr),
            ),
            const Divider(height: 40),
            ElevatedButton(
              onPressed: () {
                debugPrint("Screen Height: " + Get.height.toString());
                debugPrint("Screen Width: " + Get.width.toString());
                debugPrint("Device is iOS: " + GetPlatform.isIOS.toString());
                debugPrint(
                    "Device is Android: " + GetPlatform.isAndroid.toString());
              },
              child: Text("Get Device Info".tr),
            ),
            const Divider(height: 40),
            ElevatedButton(
              onPressed: () => _changeDarkMode(context),
              child: Text("Dark Mode".tr),
            ),
            const Divider(height: 40),
            ElevatedButton(
                onPressed: () => _changeTheme(context),
                child: Text("Change Theme".tr))
          ],
        ),
      ),
    );
  }

  switchLocale(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("SwitchLocale".tr),
            children: [
              SimpleDialogOption(
                child: const Text("中文"),
                onPressed: () {
                  Get.updateLocale(const Locale("zh"));
                  Get.back();
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text("English"),
                onPressed: () {
                  Get.updateLocale(const Locale("en"));
                  Get.back();
                },
              ),
            ],
          );
        });
  }

  switchLocale1() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      title: "SwitchLocale".tr,
      titlePadding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      titleStyle: const TextStyle(fontSize: 18, color: Colors.black),
      content: const SizedBox(height: 0, width: 0),
      onConfirm: () => Get.back(),
      cancel: SizedBox(
        width: 120,
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale("zh"));
                Get.back();
              },
              child: const Text("中文"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            )),
            const SizedBox(width: 20),
          ],
        ),
      ),
      confirm: SizedBox(
        width: 120,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale("en"));
                Get.back();
              },
              child: const Text("English"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              )),
            )),
          ],
        ),
      ),
      radius: 24,
    );
  }

  _changeDarkMode(context) {
    final MyAppController myAppController = Get.put(MyAppController());
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 240,
            child: Column(
              children: [
                ListTile(
                  leading: Obx(() => myAppController.darkMode.value == 2
                      ? const Icon(Icons.radio_button_on)
                      : const Icon(Icons.radio_button_off)),
                  title: const Text("跟随系统"),
                  onTap: () {
                    myAppController.changeDarkMode(2);
                    Get.back();
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Obx(() => myAppController.darkMode.value == 1
                      ? const Icon(Icons.radio_button_on)
                      : const Icon(Icons.radio_button_off)),
                  title: const Text("开启"),
                  onTap: () {
                    myAppController.changeDarkMode(1);
                    Get.back();
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Obx(() => myAppController.darkMode.value == 0
                      ? const Icon(Icons.radio_button_on)
                      : const Icon(Icons.radio_button_off)),
                  title: const Text("关闭"),
                  onTap: () {
                    myAppController.changeDarkMode(0);
                    Get.back();
                  },
                ),
              ],
            ),
          );
        });
  }

  _changeTheme(context) {
    final ThemeController themeController = Get.put(ThemeController());
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: Themes.colors.length * 56 + 20,
          child: Column(
            children: getThemesList(themeController),
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  List<Widget> getThemesList(ThemeController themeController) {
    List<Widget> list = [];
    Themes.colors.forEach((key, value) {
      list.add(ListTile(
        leading: SizedBox(
          width: 30,
          child: CircleAvatar(
            backgroundColor: value,
            child: Obx(
              () => themeController.theme.value == key
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : const Text(""),
            ),
          ),
        ),
        title: Text(key.tr),
        onTap: () {
          themeController.changeTheme(key);
          Get.back();
        },
      ));
    });
    return list;
  }
}
