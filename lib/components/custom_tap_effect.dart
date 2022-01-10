import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_learning/utils/num_util.dart';

class CustomTapEffect extends SingleChildRenderObjectWidget {
  ///true:与控件大小的圆背景和波纹
  final bool? borderless;
  final double? borderlessSize;

  ///true:只有在轮廓内的波纹效果
  final bool? rippleInShape;
  final bool? isIOSEffect;
  const CustomTapEffect(
      {Key? key,
      Widget? child,
      this.isIOSEffect,
      this.rippleInShape,
      this.borderless,
      this.borderlessSize})
      : super(key: key, child: child);
  @override
  CustomRippleRender createRenderObject(BuildContext context) =>
      CustomRippleRender(Material.of(context)!, isIOSEffect ?? false,
          borderless ?? false, borderlessSize, rippleInShape ?? false);
}

class CustomRippleRender extends RenderConstrainedBox {
  final bool rippleInShape;
  final bool borderless;
  final bool isIOSEffect;
  final double? borderlessSize;
  double circleRadius = 0;
  late AnimationController _radiusController;
  late Animation<double> _radius;
  final Tween<double> _tween = Tween(begin: 0);
  Animation<double>? _centerX;
  final Tween<double> _centerTweenX = Tween();

  Animation<double>? _centerY;
  final Tween<double> _centerTweenY = Tween();
  Offset? point;

  late final LayerHandle<OpacityLayer> _borderInShapeOrOpacityLayer =
      LayerHandle<OpacityLayer>();

  final Paint _paint = Paint()
    ..color = const Color(0xff000000).withOpacity(0.1);
  CustomRippleRender(MaterialInkController controller, this.isIOSEffect,
      this.borderless, this.borderlessSize, this.rippleInShape)
      : super(
            additionalConstraints: BoxConstraints.loose(
                const Size(double.infinity, double.infinity))) {
    _radiusController = AnimationController(vsync: controller.vsync)
      ..addListener(() {
        markNeedsPaint();
      });
    _radius = _radiusController.drive(_tween);
    if (borderless) {
      _centerX = _radiusController.drive(_centerTweenX);
      _centerY = _radiusController.drive(_centerTweenY);
    }
  }

  @override
  bool hitTestSelf(Offset position) => true;
  bool hasRippleChild = false;

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    bool r = super.hitTestChildren(result, position: position);
    hasRippleChild = result.path.any((e) => e.target is CustomRippleRender);
    return r;
  }

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (hasRippleChild) {
      return;
    }
    if (event is PointerDownEvent) {
      point = event.localPosition;
      circleRadius = borderless
          ? (borderlessSize ?? (size.width.max(size.height) / 2))
          : size.width + size.height;
      _tween.end = circleRadius;
      _radiusController.duration =
          Duration(milliseconds: (circleRadius / 0.2).floor());
      if (borderless) {
        _centerTweenX.begin = point!.dx;
        _centerTweenY.begin = point!.dy;
        _centerTweenX.end = size.width / 2;
        _centerTweenY.end = size.height / 2;
      }
      _radiusController.reset();
      _radiusController.forward();
    } else if (event is PointerUpEvent || event is PointerCancelEvent) {
      point = null;
      _radiusController.stop();
      markNeedsPaint();
    }
  }

  @override
  bool get alwaysNeedsCompositing =>
      child != null && point != null && (isIOSEffect || !borderless);

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    if (point != null) {
      ///点击point不为空，绘制内容和点击效果
      Rect area = Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);
      if (isIOSEffect) {
        ///IOS效果
        bool isLarge = size.width.max(size.height) > 60;
        if (isLarge) {
          ///IOS大尺寸控件需要绘制灰色背景
          super.paint(context, offset);
          canvas = context.canvas;
          canvas.drawRect(area, _paint);
        } else {
          ///IOS小尺寸控件半透明即可
          _paintWithNewLayer(
              context, offset, area, (ctx, ofs) => ctx.paintChild(child!, ofs));
        }
      } else {
        ///android水波纹效果
        if (!borderless) {
          ///水波纹带边框效果
          super.paint(context, offset);
          _paintWithNewLayer(context, offset, area, (ctx, ofs) {
            if (rippleInShape) {
              ///水波纹限制在图像内
              ctx.paintChild(child!, ofs);
              canvas = ctx.canvas;
              _paint.blendMode = BlendMode.srcATop;
              canvas.drawCircle(Offset(ofs.dx + point!.dx, ofs.dy + point!.dy),
                  _radius.value, _paint);
            } else {
              ///水波纹边框铺满控件
              canvas = ctx.canvas;
              canvas.clipRect(area);
              canvas.drawRect(area, _paint);
              canvas.drawCircle(Offset(ofs.dx + point!.dx, ofs.dy + point!.dy),
                  _radius.value, _paint);
            }
          });
        } else {
          ///水波纹圆底，圆波纹
          super.paint(context, offset);
          canvas = context.canvas;
          canvas.drawCircle(
              Offset(offset.dx + size.width / 2, offset.dy + size.height / 2),
              circleRadius,
              _paint);
          canvas.drawCircle(
              Offset(offset.dx + _centerX!.value, offset.dy + _centerY!.value),
              _radius.value,
              _paint);
        }
      }
    } else {
      ///没有点击，绘制内容
      super.paint(context, offset);
      _borderInShapeOrOpacityLayer.layer = null;
    }
  }

  void _paintWithNewLayer(PaintingContext context, Offset offset, Rect rect,
      Function(PaintingContext context, Offset offset) paintChild) {
    _borderInShapeOrOpacityLayer.layer =
        _borderInShapeOrOpacityLayer.layer ?? OpacityLayer()
          ..alpha = isIOSEffect ? 125 : 255;

    context.pushLayer(
      _borderInShapeOrOpacityLayer.layer!,
      paintChild, // 子节点绘制回调；添加完layer后，子节点会在新的layer上绘制
      offset,
      childPaintBounds: rect,
    );
  }

  @override
  void dispose() {
    point = null;
    _radiusController.dispose();
    _borderInShapeOrOpacityLayer.layer = null;
    super.dispose();
  }
}
