import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_stopwatch/cubit/states.dart';

class StopWatchCubit extends Cubit<StopWatchStates> {
  StopWatchCubit() : super(StopWatchInitial());
  static StopWatchCubit get(context) => BlocProvider.of(context);
  late Stopwatch stopwatch = Stopwatch();
  late var milli;
  String milliseconds = "000";
  String seconds = "00";
  String minutes = "00";

  late Timer timer;

  void changeTime() {
    timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      milli = stopwatch.elapsed.inMilliseconds;
      milliseconds = ((milli % 1000).toString().padLeft(3, "0"));
      seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
      minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");
      emit(StopWatchChangeTime());
    });
  }

  void startStopWatch() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
    emit(StopWatchRunning());
  }

  void reset() {
    stopwatch.reset();
    emit(StopWatchReset());
  }
}
