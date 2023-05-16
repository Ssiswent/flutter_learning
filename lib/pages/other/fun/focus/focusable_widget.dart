import 'dart:developer';

import 'package:flutter/material.dart';

class FocusableWidget extends StatelessWidget {
  FocusableWidget({
    Key? key,
    required this.child,
    required this.focusNode,
    this.onFocused,
    this.onFocusedCallback,
  }) : super(key: key);

  final Widget child;

  final Function()? onFocused;

  // final VoidCallback? resetCallback; // 还原大小回调
  final ValueSetter<FocusNode>? onFocusedCallback;

  // final FocusNode node = FocusNode();
  final FocusNode focusNode;
  late FocusNode nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return Focus(
      // focusNode: focusNode,
      onFocusChange: (isFocused) {
        if (isFocused) {
          log('onFocusChange------Focused');
          if (onFocused != null) {
            // 让自身失去焦点，防止重复弹出
            FocusScope.of(context).requestFocus(FocusNode());
            onFocused!();
          }
          // if (onFocusedCallback != null) {
          //   // 让自身失去焦点，防止重复弹出
          //   // 在失去焦点之前，记录下一个FocusNode
          //   // log('message:${focusNode.context}');
          //   nextFocusNode = FocusScope.of(context).traversalChildren.last;
          //   log('nextFocusNode----$nextFocusNode');
          //   FocusScope.of(context).requestFocus(FocusNode());
          //   onFocusedCallback!(nextFocusNode);
          // }
        } else {
          log('onFocusChange------Leave Focused');
        }
      },
      child: child,
    );
  }
}
