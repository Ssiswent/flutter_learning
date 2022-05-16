import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'fun_controller.dart';

class FunPage extends StatelessWidget {
  FunPage({Key? key}) : super(key: key);

  final controller = Get.put(FunController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ListItem(
              context,
              title: "StaggeredGridView",
              onTap: controller.toStaggeredGridViewPage,
            ),
            ListItem(
              context,
              title: "Expandable",
              onTap: controller.toExpandablePage,
            ),
            ListItem(
              context,
              title: "FlutterInnerDrawer",
              onTap: controller.toInnerDrawerPage,
            ),
            ListItem(
              context,
              title: "FloatingSearchBar",
              onTap: () => controller.toFloatingSearchBarPage(context),
            ),
            ListItem(
              context,
              title: "LottiePage",
              onTap: controller.toLottiePage,
            ),
            ListItem(
              context,
              title: "FlutterSlidablePage",
              onTap: controller.toFlutterSlidablePage,
            ),
            ListItem(
              context,
              title: "ImplicitlyAnimatedReorderableList",
              onTap: controller.toImplicitlyAnimatedReorderableList,
            ),
            ListItem(
              context,
              title: "SignatureExample",
              onTap: controller.toSignatureExample,
            ),
            ListItem(
              context,
              title: "RatingBar",
              onTap: controller.toRatingBar,
            ),
            ListItem(
              context,
              title: "PercentIndicator",
              onTap: controller.toPercentIndicator,
            ),
            ListItem(
              context,
              title: "SyncfusionDatepicker",
              onTap: controller.toSyncfusionDatepicker,
            ),
            ListItem(
              context,
              title: "SliderButton",
              onTap: controller.toSliderButton,
            ),
            ListItem(
              context,
              title: "MySliderList",
              onTap: controller.toMySliderList,
            ),
            ListItem(
              context,
              title: "AudioService",
              onTap: controller.toAudioService,
            ),
            ListItem(
              context,
              title: "ExtendedImage",
              onTap: controller.toExtendedImage,
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem(
    context, {
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(title),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
