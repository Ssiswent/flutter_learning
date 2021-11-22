// ignore_for_file: unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class SwiperPage extends StatefulWidget {
  const SwiperPage({Key? key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('轮播图'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      "images/avatar.png",
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: 4,
                pagination: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return MyIndicatorPagination(
                      itemCount: 4, activeIndex: config.activeIndex);
                }),
                // pagination: const SwiperPagination(),
                // control: const SwiperControl(),
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      "images/img1.jpeg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: 3,
                pagination: const SwiperPagination(),
                // control: const SwiperControl(),
                itemWidth: 300,
                layout: SwiperLayout.STACK,
              ),
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      "images/img1.jpeg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: 3,
                pagination: const SwiperPagination(),
                // control: const SwiperControl(),
                itemWidth: 300.0,
                itemHeight: 400.0,
                layout: SwiperLayout.TINDER,
              ),
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Swiper(
                layout: SwiperLayout.CUSTOM,
                customLayoutOption: CustomLayoutOption(
                        startIndex: -1, stateCount: 3)
                    .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                  const Offset(-370.0, -40.0),
                  const Offset(0.0, 0.0),
                  const Offset(370.0, -40.0)
                ]),
                itemWidth: 300.0,
                itemHeight: 200.0,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      "images/img1.jpeg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: 3,
                pagination: const SwiperPagination(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 170,
              // color: Colors.blue,
              child: Swiper(
                outer: false,
                itemBuilder: (c, i) {
                  return Wrap(
                    runSpacing: 6.0,
                    children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              child: Image.asset(
                                "images/img1.jpeg",
                                fit: BoxFit.cover,
                              ),
                              height: MediaQuery.of(context).size.width * 0.12,
                              width: MediaQuery.of(context).size.width * 0.12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: new Text("$i"),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.blue,
                    activeColor: Colors.yellow,
                  ),
                  margin: EdgeInsets.all(5.0),
                ),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyIndicatorPagination extends StatelessWidget {
  const MyIndicatorPagination({
    Key? key,
    required this.itemCount,
    required this.activeIndex,
  }) : super(key: key);

  final int itemCount;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    double rowWidth = (itemCount - 1) * (8 + 4) + 24;
    return Align(
      alignment: const Alignment(-0.6, 0.8),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: rowWidth + 28,
        height: 20,
        child: Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0.3),
                width: rowWidth + 28,
                height: 20),
          ),
          Center(
            child: SizedBox(
              width: rowWidth,
              child: Row(children: getRowItems(itemCount)),
            ),
          ),
        ]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  List<Widget> getRowItems(int itemCount) {
    List<Widget> rowItems = [];
    for (var i = 0; i < itemCount; i++) {
      rowItems.add(SwiperIndicator(index: i, activeIndex: activeIndex));
      if (i != itemCount - 1) {
        rowItems.add(const SizedBox(width: 4));
      }
    }
    return rowItems;
  }
}

class SwiperIndicator extends StatelessWidget {
  const SwiperIndicator({
    Key? key,
    required this.index,
    required this.activeIndex,
  }) : super(key: key);

  final int index;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: index == activeIndex ? 24 : 8,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
