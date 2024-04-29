import 'dart:async';

import 'package:aquaventure/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  Function() onTimerCompleted;
  TimerWidget({Key? key, required this.onTimerCompleted}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  static const int _durationInSeconds = 60; // Set the duration in seconds

  late Timer _timer;
  int _remainingTime = _durationInSeconds;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        formatTime(_remainingTime),
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppColors.TEXT_GREY_COLOR),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          widget.onTimerCompleted();
          // Timer has reached 0, perform any desired actions here
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatTime(int timeInSeconds) {
    int minutes = (timeInSeconds / 60).floor();
    int seconds = timeInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
