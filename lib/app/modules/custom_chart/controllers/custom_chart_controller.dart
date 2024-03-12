import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/data_item_model.dart';

class CustomChartController extends GetxController {
  final List<DataItem> dataset = [
    DataItem(0.2, "Comedy", const Color(0xffF2387C)),
    DataItem(0.25, "Action", const Color(0xff05C7F2)),
    DataItem(0.3, "Romance", const Color(0xff04D9C4)),
    DataItem(0.05, "Drama", const Color(0xffF2B705)),
    DataItem(0.2, "Sci-fi", const Color(0xffF26241)),
  ];

  late Timer timer;
  final RxDouble fullAngle = 0.0.obs;
  double secondsToComplete = 5.0;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(
      const Duration(milliseconds: 1000 ~/ 60),
      (timer) {
        fullAngle.value += 360.0 / (secondsToComplete * 1000 ~/ 60);
        if (fullAngle >= 360) {
          fullAngle.value = 360.0;
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
