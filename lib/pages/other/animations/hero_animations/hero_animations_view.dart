import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/other/animations/hero_animations/widgets/locations_widget.dart';

class HeroAnimationsPage extends StatelessWidget {
  const HeroAnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: buildAppBar(),
        body: const LocationsWidget(),
      );

  AppBar buildAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('BIOGRAFIAS'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {},
        ),
      );
}
