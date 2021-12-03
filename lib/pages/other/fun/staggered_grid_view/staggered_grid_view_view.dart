import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'staggered_grid_view_controller.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewPage extends GetView<StaggeredGridViewController> {
  const StaggeredGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StaggeredGridView"),
      ),
      body: GetBuilder<StaggeredGridViewController>(
        builder: (_) {
          return SmartRefresher(
            header: const WaterDropHeader(),
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            enablePullDown: true,
            enablePullUp: true,
            child: StaggeredGridView.countBuilder(
              primary: false,
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: controller.data.length,
              itemBuilder: (context, index) =>
                  _Tile(index, controller.data[index]),
              staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
            ),
          );
        },
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.index, this.size);

  final IntSize size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              // const Center(child: CircularProgressIndicator()),
              Center(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://picsum.photos/${size.width}/${size.height}/',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: <Widget>[
                Text(
                  'Image number $index',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Width: ${size.width}',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  'Height: ${size.height}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
