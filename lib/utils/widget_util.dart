import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_learning/components/custom_tap_effect.dart';
import 'package:get/utils.dart';

extension CustomWrap on Widget {
  Widget prop(
      {double? width,
      double? height,
      List<double>? margins,
      List<double>? paddings,
      Decoration? decoration,
      Color? bgColor,
      String bgUrl = '',
      List<double>? borderRadius,
      double? opacity,
      int expanded = 0,
      Function()? onTap,
      Function()? onLongPress,
      bool clickEffect = true,
      bool? borderless,
      double? borderlessSize,
      bool? rippleInShape,
      bool? gone,
      bool? hide,
      double? blur,
      BoxBorder? border,
      double elevation = 0.0,
      Color shadowColor = const Color(0xFF000000)}) {
    bool hasClick = onTap != null || onLongPress != null;
    BorderRadius? innerbr;
    if (borderRadius != null) {
      innerbr = borderRadius.length == 1
          ? BorderRadius.circular(borderRadius[0])
          : BorderRadius.only(
              topLeft: Radius.circular(borderRadius[0]),
              topRight: Radius.circular(borderRadius[1]),
              bottomRight: Radius.circular(borderRadius[2]),
              bottomLeft: Radius.circular(borderRadius[3]));
    }
    if (bgColor != null || bgUrl != '' || innerbr != null || border != null) {
      DecorationImage? netImage = bgUrl.startsWith("http")
          ? DecorationImage(image: NetworkImage(bgUrl), fit: BoxFit.fill)
          : null;
      DecorationImage? localImage = bgUrl != '' && !bgUrl.startsWith("http")
          ? DecorationImage(image: AssetImage(bgUrl), fit: BoxFit.fill)
          : null;
      decoration = BoxDecoration(
        color: bgColor,
        image: netImage ?? localImage,
        border: border,
        borderRadius: innerbr,
      );
    }

    //如果有点击事件，但是没有decoration，空白区域无法相应点击，所以添加透明的decoration
    if (hasClick && decoration == null) {
      decoration = const BoxDecoration(color: Colors.transparent);
    }

    Widget view = this;

    EdgeInsets margin = margins == null
        ? const EdgeInsets.all(0)
        : margins.length == 1
            ? EdgeInsets.all(margins[0])
            : EdgeInsets.fromLTRB(
                margins[0], margins[1], margins[2], margins[3]);

    view = Container(
      width: width,
      height: height,
      decoration: decoration,
      //设置borderradio后需要将margin设置在PhysicalModel之后
      margin: innerbr != null || elevation > 0 ? null : margin,
      padding: paddings == null
          ? const EdgeInsets.all(0)
          : paddings.length == 1
              ? EdgeInsets.all(paddings[0])
              : EdgeInsets.fromLTRB(
                  paddings[0], paddings[1], paddings[2], paddings[3]),
      child: view,
    );
    if (hasClick) {
      if (clickEffect) {
        if (rippleInShape ?? false) {
          borderless = false;
        }
        borderless = borderless ?? (this is Icon || (borderlessSize ?? 0) > 0);
        assert(!(borderless && (innerbr != null || elevation != 0)),
            "borderRadius、elevation不能borderless=true一起使用，borderRadius、elevation效果导致borderless为false，如果要borderless效果，将borderless单独放在后一个prop中");
        view = GestureDetector(
          child: CustomTapEffect(
            isIOSEffect: GetPlatform.isIOS,
            borderless: borderless,
            borderlessSize: borderlessSize,
            rippleInShape: rippleInShape ?? false,
            child: view,
          ),
          onTap: onTap,
          onLongPress: onLongPress,
        );
      } else {
        view = GestureDetector(
          child: view,
          onTap: onTap,
          onLongPress: onLongPress,
        );
      }
    }

    view = innerbr == null && elevation == 0
        ? view
        : PhysicalModel(
            clipBehavior: Clip.antiAlias,
            borderRadius: innerbr,
            color: bgColor ?? Colors.transparent,
            elevation: elevation,
            shadowColor: shadowColor,
            child: view,
          );

    if ((innerbr != null || elevation > 0) && margins != null) {
      view = Container(
        margin: margin,
        child: view,
      );
    }

    view = opacity == null ? view : Opacity(opacity: opacity, child: view);

    if (gone ?? hide != null) {
      gone = gone ?? false;
      hide = hide ?? false;
      view = Visibility(
        child: view,
        visible: !gone && !hide,
        maintainState: true,
        maintainAnimation: true,
        maintainSize: !gone,
        maintainInteractivity: false,
      );
    }

    view = expanded <= 0 || (gone != null && gone)
        ? view
        : Expanded(child: view, flex: hide ?? false ? 0 : expanded);

    if (blur != null && blur > 0) {
      view = ClipRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: view));
    }
    return view;
  }

  Widget loc(List<double?> rect, {double? w, double? h}) {
    return Positioned(
        left: rect[0],
        top: rect[1],
        right: rect[2],
        bottom: rect[3],
        width: w,
        height: h,
        child: this);
  }

  Widget align(
      [AlignmentGeometry alignment = Alignment.center,
      double? widthFactor,
      double? heightFactor]) {
    return Align(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this);
  }

  Widget safeArea() {
    return SafeArea(child: this);
  }
}

class SimpleText extends Text {
  SimpleText(String? data, double? fontSize, Color? fontColor,
      {Key? key, FontWeight? fw, TextAlign? ta})
      : super(data ?? '',
            key: key,
            textAlign: ta,
            style: TextStyle(
              fontSize: fontSize ?? 12,
              color: fontColor ?? Colors.black,
              fontWeight: fw ?? FontWeight.normal,
            ));
}

/// Widget Util.
class WidgetUtil {
  bool _hasMeasured = false;
  double _width = 0;
  double _height = 0;

  /// Widget rendering listener.
  /// Widget渲染监听.
  /// context: Widget context.
  /// isOnce: true,Continuous monitoring  false,Listen only once.
  /// onCallBack: Widget Rect CallBack.
  void asyncPrepare(
      BuildContext context, bool isOnce, ValueChanged<Rect>? onCallBack) {
    if (_hasMeasured) return;
    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      RenderBox? box = getRenderBox(context);
      if (box != null) {
        if (isOnce) _hasMeasured = true;
        double width = box.semanticBounds.width;
        double height = box.semanticBounds.height;
        if (_width != width || _height != height) {
          _width = width;
          _height = height;
          if (onCallBack != null) onCallBack(box.semanticBounds);
        }
      }
    });
  }

  /// Widget渲染监听.
  void asyncPrepares(bool isOnce, ValueChanged<Rect>? onCallBack) {
    if (_hasMeasured) return;
    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      if (isOnce) _hasMeasured = true;
      if (onCallBack != null) onCallBack(Rect.zero);
    });
  }

  ///get Widget Bounds (width, height, left, top, right, bottom and so on).Widgets must be rendered completely.
  ///获取widget Rect
  static Rect getWidgetBounds(BuildContext context) {
    RenderBox? box = getRenderBox(context);
    return box?.semanticBounds ?? Rect.zero;
  }

  static RenderBox? getRenderBox(BuildContext context) {
    RenderObject? renderObject = context.findRenderObject();
    RenderBox? box;
    if (renderObject != null) {
      box = renderObject as RenderBox;
    }
    return box;
  }

  ///Get the coordinates of the widget on the screen.Widgets must be rendered completely.
  ///获取widget在屏幕上的坐标,widget必须渲染完成
  static Offset getWidgetLocalToGlobal(BuildContext context) {
    RenderBox? box = getRenderBox(context);
    return box == null ? Offset.zero : box.localToGlobal(Offset.zero);
  }

  /// Suggest use ImageUtil instead.
  ///
  /// get image width height，load error return Rect.zero.（unit px）
  /// Gif is not supported.
  /// 获取图片宽高，加载错误情况返回 Rect.zero.（单位 px）
  /// image
  /// url network
  /// local url , package
  static Future<Rect> getImageWH({
    Image? image,
    String? url,
    String? localUrl,
    String? package,
    ImageConfiguration? configuration,
  }) {
    if (image == null &&
        (url == null || url.isEmpty) &&
        (localUrl == null || localUrl.isEmpty)) {
      return Future.value(Rect.zero);
    }
    Completer<Rect> completer = Completer<Rect>();
    Image? img = image;
    img ??= (url != null && url.isNotEmpty)
        ? Image.network(url)
        : Image.asset(localUrl!, package: package);
    img.image
        .resolve(configuration ?? const ImageConfiguration())
        .addListener(ImageStreamListener(
          (ImageInfo info, bool synchronousCall) {
            if (!completer.isCompleted) {
              completer.complete(Rect.fromLTWH(0, 0,
                  info.image.width.toDouble(), info.image.height.toDouble()));
            }
          },
          onError: (dynamic exception, StackTrace? stackTrace) {
            if (!completer.isCompleted) {
              completer.complete(Rect.zero);
            }
          },
        ));
    return completer.future;
  }

  /// Suggest use ImageUtil instead.
  ///
  /// get image width height, load error throw exception.（unit px）
  /// Gif is not supported.
  /// 获取图片宽高，加载错误会抛出异常.（单位 px）
  /// image
  /// url network
  /// local url (full path/全路径，example："assets/images/ali_connors.png"，""assets/images/3.0x/ali_connors.png"" );
  /// package
  static Future<Rect> getImageWHE({
    Image? image,
    String? url,
    String? localUrl,
    String? package,
    ImageConfiguration? configuration,
  }) {
    if (image == null &&
        (url == null || url.isEmpty) &&
        (localUrl == null || localUrl.isEmpty)) {
      return Future.error("image is null.");
    }
    Completer<Rect> completer = Completer<Rect>();
    Image? img = image;
    img ??= (url != null && url.isNotEmpty)
        ? Image.network(url)
        : Image.asset(localUrl!, package: package);
    img.image
        .resolve(configuration ?? const ImageConfiguration())
        .addListener(ImageStreamListener(
          (ImageInfo info, bool synchronousCall) {
            if (!completer.isCompleted) {
              completer.complete(Rect.fromLTWH(0, 0,
                  info.image.width.toDouble(), info.image.height.toDouble()));
            }
          },
          onError: (dynamic exception, StackTrace? stackTrace) {
            if (!completer.isCompleted) {
              completer.completeError(exception, stackTrace);
            }
          },
        ));
    return completer.future;
  }
}
