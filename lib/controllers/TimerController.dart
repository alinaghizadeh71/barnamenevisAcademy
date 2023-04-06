import 'package:get/get.dart';
import 'dart:async';
class TimerController extends GetxController {
   static const maxSeconds = 180;
  var seconds = maxSeconds;
  Timer? timer;
 static const oneSec = const Duration(milliseconds: 1000);
  /// Start Timer
  void startTimer({bool rest = true}) {
    if (rest) {
      resetTimer();
      update(['4','5','6','7','8']);
    }
    timer = Timer.periodic(oneSec, (timer) {
      if (seconds > 0) {
        seconds--;
        update(['4','5','6','7','8']);
      } else {
        stopTimer(rest: false);
       // resetTimer();
      }
    });
  }

  /// Stop Timer
  void stopTimer({bool rest = true}) {
    if (rest) {
      resetTimer();
      update(['4','5','6','7','8']);
    }
    timer?.cancel();
    update(['4','5','6','7','8']);
  }

  /// Reset Timer
  void resetTimer() {
    seconds = maxSeconds;
   update(['4','5','6','7','8']);
  }

  /// is Timer Active?
  bool isTimerRuning() {
    return timer == null ? false : timer!.isActive;
  }

  /// is Timer Completed?
  bool isCompleted() {
    return seconds == maxSeconds || seconds == 0;
  }
}