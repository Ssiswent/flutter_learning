import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import 'material_floating_search_bar_controller.dart';

class FloatingSearchBarPage extends StatelessWidget {
  FloatingSearchBarPage({Key? key}) : super(key: key);

  final controller = Get.put(FloatingSearchBarGetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is handled by the search bar itself.
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Container(
          width: 200,
        ),
      ),
      body: buildFloatingSearchBar(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.arrow_forward_rounded,
          size: 40,
        ),
        onPressed: controller.toFloatingSearchAppBarExample,
      ),
    );
  }

  Widget buildFloatingSearchBar(context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return GetBuilder<FloatingSearchBarGetController>(
      builder: (_) {
        return FloatingSearchBar(
          controller: controller.searchController,
          automaticallyImplyBackButton: false,
          hint: 'Search...',
          title: Text(controller.nowName),
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 800),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: isPortrait ? 0.0 : -1.0,
          openAxisAlignment: 0.0,
          width: isPortrait ? 600 : 500,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: controller.onQueryChanged,
          // Specify a custom transition to be used for
          // animating between opened and closed stated.
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: CircularButton(
                icon: const Icon(Icons.place),
                onPressed: () {},
              ),
            ),
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
          ],
          builder: (context, transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: controller.newNames.map((name) {
                    return InkWell(
                      onTap: () => controller.clickOnItems(name: name),
                      child: ListTile(
                        title: Text(name),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
          body: const SomeScrollableContent(),
        );
      },
    );
  }
}

class SomeScrollableContent extends StatelessWidget {
  const SomeScrollableContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBarScrollNotifier(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        itemCount: 100,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}

class FloatingSearchAppBarExample extends StatelessWidget {
  FloatingSearchAppBarExample({Key? key}) : super(key: key);

  final controller = Get.put(FloatingSearchBarGetController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FloatingSearchBarGetController>(
      builder: (_) {
        return FloatingSearchAppBar(
          controller: controller.searchController1,
          title: Text(controller.nowName),
          transitionDuration: const Duration(milliseconds: 800),
          color: Colors.greenAccent.shade100,
          colorOnScroll: Colors.greenAccent.shade200,
          onQueryChanged: controller.onQueryChanged,
          body: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: controller.newNames.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => controller.clickOnItems(name: controller.newNames[index]),
                child: ListTile(
                  title: Text(controller.newNames[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
