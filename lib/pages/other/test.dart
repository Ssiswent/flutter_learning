import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 44,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff164686),
                Color(0xff1E385A),
              ],
            ),
          )),
      Expanded(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              // DateTime.now().isAfter(order.date ?? DateTime.now());
              return Container(
                width: double.infinity,
                height: 160,
                color: Colors.blue,
              );
            },
          ),
        ),
      ),
    ]);
  }
}
