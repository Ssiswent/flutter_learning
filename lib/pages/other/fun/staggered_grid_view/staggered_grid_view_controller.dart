import 'dart:math';
import 'dart:typed_data';

import 'getx_list_controller.dart';

class StaggeredGridViewController extends GetxListController {
  static const int _kItemCount = 5;

  @override
  queryData() async {
    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 2));
    List sizes = [];
    // 模拟只有两页数据
    if (page <= 2) {
      sizes = _createSizes(_kItemCount).toList();
    }
    successActionWithObjects(sizes);
  }
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

List<IntSize> _createSizes(int count) {
  final rnd = Random();
  return List.generate(
      count, (i) => IntSize(rnd.nextInt(500) + 200, rnd.nextInt(800) + 200));
}

final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
