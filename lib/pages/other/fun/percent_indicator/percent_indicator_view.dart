import 'package:flutter/material.dart';
import 'package:flutter_learning/utils/widget_util.dart';
import 'package:get/get.dart';
import 'percent_indicator_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentIndicatorPage extends GetView<PercentIndicatorController> {
  const PercentIndicatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PercentIndicator"),
      ),
      body: ListView(
        children: [
          CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 10.0,
            percent: 0.8,
            header: const Text("Icon header").prop(margins: [0, 0, 0, 16]),
            center: const Icon(
              Icons.person_pin,
              size: 50.0,
              color: Colors.blue,
            ),
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ).prop(margins: [16]),
          CircularPercentIndicator(
            radius: 130.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 15.0,
            percent: 0.4,
            center: const Text(
              "40 hours",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.yellow,
            progressColor: Colors.red,
          ).prop(margins: [16]),
          CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 13.0,
            animation: true,
            percent: 0.7,
            center: const Text(
              "70.0%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: const Text(
              "Sales this week",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ).prop(margins: [0, 16, 0, 0]),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ).prop(margins: [16]),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: 1.0,
              center: const Text("100%"),
              progressColor: Colors.green,
            ),
          ).prop(margins: [16]),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.10,
                  center: const Text("10%"),
                  progressColor: Colors.red,
                ),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.30,
                  center: const Text("30%"),
                  progressColor: Colors.orange,
                ),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.60,
                  center: const Text("60%"),
                  progressColor: Colors.yellow,
                ),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.90,
                  center: const Text("90%"),
                  progressColor: Colors.green,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
