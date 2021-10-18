import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CounterLogic extends GetxController {
  var count = 0;
  var count1 = 0;
  var count2 = 0.obs;

  @override
  void onInit() {
    // https://www.icodebang.com/article/250898
    // 防抖 2 秒内
    // 如果listener持续在变化的话就不会执行 callback。如果在超过time时间长度内没有变更才会调用一次callback
    debounce(
      count2,
      (value) {
        count1++;
        update(["count1"]);
        debugPrint("debounce -> " + value.toString());
      },
      time: const Duration(seconds: 2),
    );

    // 使用和 debounce 类似，只是会忽略间隔 time 时间范围内的变化，在状态变量发生变化且每隔 time时间才会调用1次 callback。同时增加了一个 condition（一个返回true 或 false 的函数），只有在该函数返回 true 时才会执行 callback
    // interval(
    //   count2,
    //   (value) {
    //     count1++;
    //     update(["count1"]);
    //     debugPrint("debounce -> " + value.toString());
    //   },
    //   time: const Duration(seconds: 2),
    // );
    super.onInit();
  }

  ///自增
  void increase() {
    ++count;
    // 局部更新
    update(["count"]);
  }

  ///自增
  void increase1() {
    ++count1;
    update(["count1"]);
  }

  ///自增
  void increase2() {
    ++count2;
  }
}
