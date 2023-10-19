import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PurchaseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  RxList<bool> isSelectedList = List.generate(4, (index) => false).obs;
  RxInt index = 0.obs;

  void updateSelection(int selectedindex) {
    index.value = selectedindex;
    print("DDDDDDDD $index  ");
    update();
  }

  // counttimer

  Timer? countdownTimer;
  Rx<Duration> myDuration =
      Duration(days: 0, hours: 23, minutes: 59, seconds: 59).obs;

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    countdownTimer?.cancel();
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    myDuration.value = Duration(days: 1);
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    final seconds = myDuration.value.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      stopTimer();
    } else {
      myDuration.value = Duration(seconds: seconds);
      formatDuration(myDuration.value);
    }
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  void formatDuration(Duration duration) {
    final days = strDigits(duration.inDays);
    final hours = strDigits(duration.inHours.remainder(24));
    final minutes = strDigits(duration.inMinutes.remainder(60));
    final seconds = strDigits(duration.inSeconds.remainder(60));

    print('$days:$hours:$minutes:$seconds');
  }
}
