import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'flutter_slidable_controller.dart';

class FlutterSlidablePage extends GetView<FlutterSlidableController> {
  const FlutterSlidablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterSlidable"),
      ),
      body: GetBuilder<FlutterSlidableController>(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.dataArray.length,
            itemBuilder: (BuildContext context, int index) {
              String title = controller.dataArray[index];
              return SlidableItem(
                  index: index, title: title, controller: controller);
            },
          );
        },
      ),
    );
  }
}

class SlidableItem extends StatelessWidget {
  const SlidableItem({
    Key? key,
    required this.index,
    required this.title,
    required this.controller,
  }) : super(key: key);

  final int index;
  final String title;
  final FlutterSlidableController controller;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: ValueKey(title),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(
          onDismissed: () {
            controller.decrement(index: index);
          },
          // closeOnCancel: true,
          // confirmDismiss: () async {
          //   return await showDialog<bool>(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //             title: const Text('Are you sure?'),
          //             content: const Text('Are you sure to dismiss?'),
          //             actions: [
          //               TextButton(
          //                 onPressed: () {
          //                   Navigator.of(context).pop(true);
          //                 },
          //                 child: const Text('Yes'),
          //               ),
          //               TextButton(
          //                 onPressed: () {
          //                   Navigator.of(context).pop(false);
          //                 },
          //                 child: const Text('No'),
          //               ),
          //             ],
          //           );
          //         },
          //       ) ??
          //       false;
          // },
        ),
        // dragDismissible: false,

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (c) {
              controller.decrement(index: index);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (c) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (c) {},
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (c) {},
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: ListTile(title: Text('title: $title')),
    );
  }
}
