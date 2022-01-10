import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class FlutterInnerDrawer extends StatelessWidget {
  FlutterInnerDrawer({Key? key}) : super(key: key);

  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  void _toggle() {
    _innerDrawerKey.currentState?.toggle(
        // direction is optional
        // if not set, the last direction will be used
        //InnerDrawerDirection.start OR InnerDrawerDirection.end
        direction: InnerDrawerDirection.start);
    // _innerDrawerKey.currentState?.open();
  }

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
      key: _innerDrawerKey,
      onTapClose: true, // default false
      swipe: true, // default true
      swipeChild: true, // default false
      colorTransitionChild: Colors.black54, // default Color.black54
      colorTransitionScaffold: Colors.black54, // default Color.black54

      //When setting the vertical offset, be sure to use only top or bottom
      offset: const IDOffset.only(bottom: 0.0, right: 0.0, left: 0.5),
      // scale:
      //     const IDOffset.horizontal(0.8), // set the offset in both directions

      proportionalChildArea: true, // default true
      // borderRadius: 50, // default 0
      leftAnimationType: InnerDrawerAnimation.linear, // default static
      // rightAnimationType: InnerDrawerAnimation.quadratic,
      // backgroundDecoration: const BoxDecoration(
      //     color: Colors.white), // default  Theme.of(context).backgroundColor

      //when a pointer that is in contact with the screen and moves to the right or left
      // onDragUpdate: (double val, InnerDrawerDirection? direction) {
      //   // return values between 1 and 0
      //   print(val);
      //   // check if the swipe is to the right or to the left
      //   print(direction == InnerDrawerDirection.start);
      // },
      // innerDrawerCallback: (a) =>
      //     print(a), // return  true (open) or false (close)
      leftChild: Scaffold(
        body: Container(
          color: Colors.white,
          child: const Center(
            child: Text("Left Child"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.change_circle_outlined,
            size: 40,
          ),
          onPressed: _toggle,
        ),
      ), // required if rightChild is not set
      // rightChild: Container(), // required if leftChild is not set
      scaffold: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: const Text("InnerDrawer"),
        // ),
        body: Container(
          color: Colors.white,
          child: const Center(
            child: Text("ssss"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.change_circle_outlined,
            size: 40,
          ),
          onPressed: _toggle,
        ),
      ),
    );
  }
}
