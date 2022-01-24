import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'box.dart';
import 'implicitly_animated_reorderable_list_controller.dart';

class ImplicitlyAnimatedReorderableListPage
    extends GetView<ImplicitlyAnimatedReorderableListController> {
  const ImplicitlyAnimatedReorderableListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImplicitlyAnimatedReorderableList"),
      ),
      body: GetBuilder<ImplicitlyAnimatedReorderableListController>(
        builder: (_) {
          return ListView(
            controller: controller.scrollController,
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              _buildVerticalLanguageList(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildVerticalLanguageList() {
    Reorderable buildReorderable(
      String lang,
      Widget Function(Widget tile) transition,
    ) {
      return Reorderable(
        key: ValueKey(lang),
        builder: (context, dragAnimation, inDrag) {
          // final tile = Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     _buildTile(lang),
          //     const Divider(height: 0),
          //   ],
          // );

          return AnimatedBuilder(
            animation: dragAnimation,
            builder: (context, _) {
              final t = dragAnimation.value;
              final color = Color.lerp(Colors.white, Colors.grey.shade100, t);

              return Material(
                color: color,
                elevation: lerpDouble(0, 8, t)!,
                child: transition(_buildTile(lang)),
              );
            },
          );
        },
      );
    }

    return ImplicitlyAnimatedReorderableList<String>(
      items: controller.dataArray,
      shrinkWrap: true,
      reorderDuration: const Duration(milliseconds: 200),
      liftDuration: const Duration(milliseconds: 300),
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
      onReorderStarted: (item, index) => controller.onReorderStarted(),
      onReorderFinished: (movedLanguage, from, to, newItems) =>
          controller.onReorderFinished(newItems),
      itemBuilder: (context, itemAnimation, lang, index) {
        return buildReorderable(lang, (tile) {
          return SizeFadeTransition(
            sizeFraction: 0.7,
            curve: Curves.easeInOut,
            animation: itemAnimation,
            child: tile,
          );
        });
      },
      updateItemBuilder: (context, itemAnimation, lang) {
        return buildReorderable(lang, (tile) {
          return FadeTransition(
            opacity: itemAnimation,
            child: tile,
          );
        });
      },
      footer: _buildFooter(),
    );
  }

  Widget _buildTile(
    String lang,
  ) {
    return Slidable(
      key: ValueKey(lang),
      startActionPane: ActionPane(
        extentRatio: 0.2,
        dragDismissible: false,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => controller.deleteItem(lang: lang),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        alignment: Alignment.center,
        // For testing different size item. You can comment this line
        // padding:  EdgeInsets.zero,
        child: ListTile(
          title: Text(lang),
          leading: SizedBox(
            width: 36,
            height: 36,
            child: Center(
              child: Text('${controller.dataArray.indexOf(lang) + 1}'),
            ),
          ),
          trailing: const Handle(
            delay: Duration(milliseconds: 0),
            capturePointer: true,
            child: Icon(
              Icons.drag_handle,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Box(
      color: Colors.white,
      onTap: controller.addItem,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          ListTile(
            leading: SizedBox(
              height: 36,
              width: 36,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              ),
            ),
            title: Text('Add a language'),
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}
